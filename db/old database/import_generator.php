<?php

/* simple functions for connecting to a database & querying */
/* not recommended to edit this. you probably wanna go to the 46th line */
function database ($dbname, $username = null, $password = null, $hostname = null)
{
  is_array($dbname) and extract($dbname);

  try
  {
    $db = new PDO('mysql:dbname=' . $dbname . ';host=' . $hostname, $username, $password);
    $db->prepare('SET NAMES utf8;')->execute();
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $db;
  }
  catch (PDOException $exception)
  {
    exit($exception->getMessage());
  }
}

function query($sql, $data = NULL, $fetch_single = FALSE)
{
  global $db;
  $statement = $db->prepare($sql);
  $statement->closeCursor();
  $status = $statement->execute($data);
  if ($fetch_single)
  {
    $result = $statement->fetch(PDO::FETCH_ASSOC);
    return $result;
  }
  else
  {
    $is_select = (preg_match('/^(\s|\n|\r)*select/', strtolower($sql)) == 1);
    if ($is_select)
    {
      $result = $statement->fetchAll(PDO::FETCH_ASSOC);
      return $result;
    }
  }
  return $status;
}



 header('Content-Type: text/html; charset=utf-8');

 $db = database('gyla_db_import', 'root', 'asdfg', 'localhost');

 $levels = array('pec', 'dec');

 $keys = array(
   'cat' => 'category_id',
   'type' => 'violation_type_id',
   'darg_dro' => 'violation_time',
   'mocme' => 'witness',
   'damkvirvebeli' => 'observer_name',
   'd_tel' => 'observer_phone',
   'olqi' => 'election_district_name',
   'dargveva' => 'description',
   'status' => 'status_old',
   'komisia' => 'election_precinct_number'
 );

 $keys2 = array(
   'sach_avtori' => 'complaint_author_name',
   'sach_avtori_tel' => 'complaint_author_phone',
   'sach_dro' => 'complaint_writing_time',
   'motxovna' => 'request_in_complaint',
   'sach_mimd' => 'status_id',
   'name' => 'court_name',
   'note' => 'additional_comment'
 );

 $id_keys = array('type', 'sach_mimd', 'cat');

 $text  =
"    ###############  RECORDS FROM OLD DATABASE BEGIN  ##############\n";


 foreach ($levels as $level)
 {
   $text .= "      ###############  " . $level . " level begin  ##############\n";

   $rs = query('select * from gyla_' . $level);

   foreach ($rs as $r)
   {
     $c = "c = Complaint.create(";
     $a = "a = c.complaint_additional_infos.create(";

     $c .= '{:level => \'' . $level . '\', :original_level => \'' . $level . '\', ';
     $a .= '{:level => \'' . $level . '\', ';

     $a_empty = true;

     foreach ($r as $key => $val)
     {
       if (in_array($key, $id_keys) && strlen($val) > 0)
       {
         switch ($key)
         {
           case 'cat':
             $c .= ':' . $keys[$key]  . ' => Category.find_or_create_by_title(:title => \'' . $val . '\').id, ';
             break;
           case 'type':
             $c .= ':' . $keys[$key]  . ' => ViolationType.find_or_create_by_title(:title => \'' . $val . '\').id, ';
             break;
           case 'sach_mimd':
             $a .= ':' . $keys2[$key]  . ' => Status.find_or_create_by_title(:title => \'' . $val . '\').id, ';
             break;
         }
       }
       elseif ($key == 'status')
       {
         if (empty($val))
         {
           $c .= ':' . $keys[$key]  . ' => \'yes\', ';
         }
         else
         {
           $c .= ':' . $keys[$key]  . ' => \'' . $val . '\', ';
         }
       }
       elseif (array_key_exists($key, $keys))
       {
         $c .= ':' . $keys[$key]  . ' => \'' . $val . '\', ';
       }
       elseif (array_key_exists($key, $keys2))
       {
         if (!empty($val) && strlen($val) > 0 && $val != '0000-00-00 00:00:00' && $a_empty)
         {
           $a_empty = false;
         }
         $a .= ':' . $keys2[$key] . ' => \'' . $val . '\', ';
       }
     }

     $date = (!empty($r['darg_dro']) && $r['darg_dro'] != '0000-00-00 00:00:00') ? $r['darg_dro'] : '2010-05-30 07:00:00';
     $c .= ':created_at => \'' . $date . '\', :updated_at => \'' . $date . '\', ';
     $a .= ':created_at => \'' . $date . '\', :updated_at => \'' . $date . '\', ';


     $c = rtrim($c,  ', ') . "})\nc.save(:validate => false)";
     $a = rtrim($a, ', ') . "})\na.save(:validate => false)";

     if ($a_empty)
     {
       $a = null;
     }

     $text .= $c . "\n" . $a . "\n";
   }

   $text .= "      ###############  " . $level . " level end    ##############\n";
 }

 $text  .=
"    ###############  RECORDS FROM OLD DATABASE END  ##############";



 print_r($text);
 die;






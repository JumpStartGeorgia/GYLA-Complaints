class DistrictIdName < ActiveRecord::Base
  default_scope order("district_id")

	attr_accessible :record_count

	def self.with_complaints_count
		sql = "select d.district_id, d.district_name, if(c.record_count is null, 0, c.record_count) as record_count "
		sql << "from  "
		sql << "district_id_names as d  "
		sql << "left join (select election_district_name, count(*) as record_count from complaints group by election_district_name) "
		sql << "  as c on c.election_district_name = d.district_id "
		sql << "order by d.district_id "

		find_by_sql(sql)
	end

	def self.with_pec_count
		sql = "select d.district_id, d.district_name, if(c.record_count is null, 0, c.record_count) as record_count "
		sql << "from  "
		sql << "district_id_names as d  "
		sql << "left join (select election_district_number, count(*) as record_count from pec_forms group by election_district_number) "
		sql << "  as c on c.election_district_number = d.district_id "
		sql << "order by d.district_id "

		find_by_sql(sql)
	end

	def self.with_dec_count
		sql = "select d.district_id, d.district_name, if(c.record_count is null, 0, c.record_count) as record_count "
		sql << "from  "
		sql << "district_id_names as d  "
		sql << "left join (select district_name_id, count(*) as record_count from dec_forms group by district_name_id) "
		sql << "  as c on c.district_name_id = d.district_id "
		sql << "order by d.district_id "

		find_by_sql(sql)
	end
end

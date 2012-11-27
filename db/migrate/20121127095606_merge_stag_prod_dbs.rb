class MergeStagProdDbs < ActiveRecord::Migration
  def up
		puts "********************************************************************"
		puts "This migration is inteded to only be run on a development machine."
		puts "!!! There is no rollback for this migration !!!"
		puts "This migration requires the following:"
		puts "- /tmp/system/production folder with folders from prod for complaint_files (just the folders with the ids as the names)"
		puts "- /tmp/system/staging folder with folders from staging for complaint_files (just the folders with the ids as the names)"
		puts "- staging db loaded as the main db for this app"
		puts "- production db loaded as gyla_complaints_prod"
		puts "********************************************************************"

		staging_path = "#{Rails.root}/tmp/system/staging"
		production_path = "#{Rails.root}/tmp/system/production"
		files_exist = false

		# check for folders
		files_exist = true if File.exists?(staging_path) && File.exists?(production_path)

		# check for 2nd database
		sql = 'select 1 from gyla_complaints_prod.complaints limit 1'
		second_db_exists = true
		begin
	    connection.execute(sql)
		rescue
			second_db_exists = false
		end

		if files_exist
			if second_db_exists
				puts "required folders found, continuing with migration script"

				##########################
				# move dec forms and the associated child form records
				##########################
				puts "*****************"
				puts "moving dec forms"
				puts "*****************"
				# get records that need to be moved
				sql = "select * from gyla_complaints_prod.dec_forms where updated_at > '2012-11-15'"
				x = ActiveRecord::Base.connection.select_all(sql)
				puts " - there are #{x.length} dec forms to move"
				x.each do |dec|
					puts " -- moving dec form #{dec['id']}"
					new_dec = DecForm.create(
									:dec_total_complaints => dec['dec_total_complaints'],
									:dec_journal_registration_yes_no => dec['dec_journal_registration_yes_no'],
									:ped_entered_with_law => dec['ped_entered_with_law'],
									:lonked_election_lists => dec['lonked_election_lists'],
									:complaints => dec['complaints'],
									:get_send_act => dec['get_send_act'],
									:describe_extra_env => dec['describe_extra_env'],
									:was_canonical_procedures_done => dec['was_canonical_procedures_done'],
									:where_props_filled => dec['where_props_filled'],
									:precinct_results_canel_proc => dec['precinct_results_canel_proc'],
									:commission_summary_report_publicity => dec['commission_summary_report_publicity'],
									:extra_env_describe => dec['extra_env_describe'],
									:summed_up_or_not_summary_reports => dec['summed_up_or_not_summary_reports'],
									:created_at => dec['created_at'],
									:updated_at => dec['updated_at'],
									:district_name_id => dec['district_name_id'],
									:observer_name => dec['observer_name'],
									:monitoring_time => dec['monitoring_time'],
									:organisation_name => dec['organisation_name']
					)
					puts " --> new dec form id #{new_dec.id}"

					# if child dec_forms exist, add them too
					sql_dec_child = "select * from gyla_complaints_prod.dec_form_children where dec_form_id = #{dec['id']}"
					y = ActiveRecord::Base.connection.select_all(sql_dec_child)
					puts " --- there are #{y.length} dec child forms"
					y.each do |dec_child|
						puts " ---- moving dec child form #{dec_child['id']}"
						new_dec_child = DecFormChild.create(
								:complaint_author_presentator => dec_child['complaint_author_presentator'],
								:response_precinct_commission => dec_child['response_precinct_commission'],
								:complaint_district_registration_time => dec_child['complaint_district_registration_time'],
								:violation_essence => dec_child['violation_essence'],
								:request => dec_child['request'],
								:complaint_disscusion_time => dec_child['complaint_disscusion_time'],
								:where_parties_invited_to_disscusion => dec_child['where_parties_invited_to_disscusion'],
								:disscusion_people => dec_child['disscusion_people'],
								:all_commission_memebers_attended => dec_child['all_commission_memebers_attended'],
								:report_while_meeting => dec_child['report_while_meeting'],
								:testimonies_investigation_evaluation => dec_child['testimonies_investigation_evaluation'],
								:extra_comments => dec_child['extra_comments'],
								:dec_desision => dec_child['dec_desision'],
								:was_desision_grounded => dec_child['was_desision_grounded'],
								:does_pary_plans_to_complaint => dec_child['does_pary_plans_to_complaint'],
								:describe_other_extra_env => dec_child['describe_other_extra_env'],
								:created_at => dec_child['created_at'],
								:updated_at => dec_child['updated_at'],
								:dec_form_id => new_dec.id,
								:complaint_satisfied => dec_child['complaint_satisfied']
						)

						puts " ----> new dec child form id #{new_dec_child.id}"
					end
				end
				puts "*****************"
				puts "done moving dec forms"
				puts "*****************"


				# move complaints and its children records
				puts "*****************"
				puts "moving complaints"
				puts "*****************"
				# get records that need to be moved
				sql = "select * from gyla_complaints_prod.complaints where updated_at > '2012-10-23'"
				x = ActiveRecord::Base.connection.select_all(sql)
				puts " - there are #{x.length} complaints to update"
				x.each do |complaint|
					puts " -- updating complaint #{complaint['id']}"
					new_comp = Complaint.find(complaint['id'])
					new_comp.created_at = complaint['created_at']
					new_comp.updated_at = complaint['updated_at']
					new_comp.level = complaint['level']
					new_comp.original_level = complaint['original_level']
					new_comp.observer_name = complaint['observer_name']
					new_comp.observer_address = complaint['observer_address']
					new_comp.observer_phone = complaint['observer_phone']
					new_comp.election_district_name = complaint['election_district_name']
					new_comp.election_precinct_number = complaint['election_precinct_number']
					new_comp.category_id = complaint['category_id']
					new_comp.violation_type_id = complaint['violation_type_id']
					new_comp.violation_time = complaint['violation_time']
					new_comp.witness = complaint['witness']
					new_comp.violator_info = complaint['violator_info']
					new_comp.other_info = complaint['other_info']
					new_comp.description = complaint['description']
					new_comp.save

					# if child complaint exist, add them too
					sql_comp_child = "select * from gyla_complaints_prod.complaint_additional_infos where complaint_id = #{complaint['id']}"
					y = ActiveRecord::Base.connection.select_all(sql_comp_child)
					puts " --- there are #{y.length} complaint child forms"
					y.each do |comp_child|
						new_comp_child = ComplaintAdditionalInfo.where("id = ? and created_at < ?", comp_child['id'], '2012-10-07')
						if new_comp_child && !new_comp_child.empty?
							new_comp_child = new_comp_child.first
							puts " ---- updating complaint child #{comp_child['id']}"
							new_comp_child.level = comp_child['level']
							new_comp_child.status_id = comp_child['status_id']
							new_comp_child.complaint_author_name = comp_child['complaint_author_name']
							new_comp_child.complaint_author_phone = comp_child['complaint_author_phone']
							new_comp_child.court_name = comp_child['court_name']
							new_comp_child.complaint_writing_time = comp_child['complaint_writing_time']
							new_comp_child.request_in_complaint = comp_child['request_in_complaint']
							new_comp_child.response_date = comp_child['response_date']
							new_comp_child.complaint_result = comp_child['complaint_result']
							new_comp_child.additional_comment = comp_child['additional_comment']
							new_comp_child.created_at = comp_child['created_at']
							new_comp_child.updated_at = comp_child['updated_at']
							new_comp_child.save
						else
							puts " ---- moving complaint child #{comp_child['id']}"
							new_comp_child = ComplaintAdditionalInfo.create(
								:complaint_id => new_comp.id,
								:level => comp_child['level'],
								:status_id => comp_child['status_id'],
								:complaint_author_name => comp_child['complaint_author_name'],
								:complaint_author_phone => comp_child['complaint_author_phone'],
								:court_name => comp_child['court_name'],
								:complaint_writing_time => comp_child['complaint_writing_time'],
								:request_in_complaint => comp_child['request_in_complaint'],
								:response_date => comp_child['response_date'],
								:complaint_result => comp_child['complaint_result'],
								:additional_comment => comp_child['additional_comment'],
								:created_at => comp_child['created_at'],
								:updated_at => comp_child['updated_at']
							)
							puts " ----> new complaint child form id #{new_comp_child.id}"
						end
					end


					# if complaint files exist, add them too
					sql_comp_files = "select * from gyla_complaints_prod.complaint_files where complaint_id = #{complaint['id']}"
					z = ActiveRecord::Base.connection.select_all(sql_comp_files)
					puts " --- there are #{z.length} complaint files"
					z.each do |comp_files|
						puts " ---- moving complaint file #{comp_files['id']}"
						new_comp_file = ComplaintFile.create(
							:complaint_id => new_comp.id,
							:file_file_name => comp_files['file_file_name'],
							:file_content_type => comp_files['file_content_type'],
							:file_file_size => comp_files['file_file_size'],
							:file_updated_at => comp_files['file_updated_at'],
							:created_at => comp_files['created_at'],
							:updated_at => comp_files['updated_at'],
							:attachment_type => comp_files['attachment_type'],
							:additional_info_id => comp_files['additional_info_id']
						)
						puts " ----> new complaint file id #{new_comp_file.id}"



					end


				end

				puts " -copying complaint files under system folder from prod to staging"
				# copy all files from prod to staging
				FileUtils.cp_r("#{production_path}/.", staging_path)

				puts "*****************"
				puts "done moving complaints"
				puts "*****************"


				puts "DONE!"

			else
				puts "*********** The gyla_complaints_prod could not be found or this user does not have access so this migration is being skipped. ***********"
			end
		else
			puts "*********** The required folders could not be found so this migration is being skipped. ***********"
		end
  end

  def down
		#do nothing
		puts "*********** Nothing is undone with the rollback. ***********"
		puts "*********** If the database changed with this migration, you will have to reload the entire database. ***********"
  end
end

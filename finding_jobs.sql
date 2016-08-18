select * from autoload.autoload_jobs

select * from autoload.autoload_job_actions

select * from autoload.dwf_action_processor_map

select * from autoload.dwf_jobactions

select * from autoload.dwf_processors

select * from autoload.autoload_job_logs

select * from autoload.autoload_param_logs


-- taylors query for query items
select distinct ja.jobact_index action_num, 
       ja.jobact_comment action_comment, 
       apm.position dwf_processor_pos, 
       p.name processor_type, 
       apm.name processor_name, 
       apm.enabled processor_enabled,
       cs.id, cs.key_group, cs.key, csl.line, csl.value
  from autoload.autoload_jobs j, 
       autoload.autoload_job_actions ja, 
       autoload.dwf_action_processor_map apm, 
       autoload.dwf_processors p, 
       dmi.config_settings cs, 
       dmi.config_setting_lines csl 
 where ja.jobact_job_id = j.job_id 
   and apm.action_guid = ja.guid 
   and apm.processor_guid = p.guid 
   and j.job_id = '3352800'--:job_id 
   and cs.id = apm.guid 
   and csl.guid = cs.guid 
   and p.name in ('Database Query', 'Subordinate Database Query')
   and cs.key_group  = 'QUERY'
   and cs.key = 'SQL'
order by ja.jobact_index, apm.position, cs.key_group, cs.key, csl.line


select * from autoload.autoload_job_logs 
where 1=1
and log_job_id = '3379163' 
and log_failed = 0
and rownum = 1
order by log_start_time desc
-- guid = 1728FA465B557D29E05352D81DAC9635  F1ABFE30217D34FFE04352D81DAC78D4
-- session_guid = 1728FA465B567D29E05352D81DAC9635

select * from autoload.
select * from autoload.autoload_action_logs where log_guid = hextoraw('F1ABFE30217D34FFE04352D81DAC78D4')
select * from autoload.autoload_param_logs where log_guid = hextoraw('1728FA465B557D29E05352D81DAC9635')

select * from autoload.autoload_job_logs where log_job_id = '3327686'
select * from autoload.autoload_jobs where job_id = '3327686'
select * from autoload.autoload_param_logs where log_guid = hextoraw('E8533CECA26EF73BE0401DAC10D85576') and name = 'FTP_TYPE'

select * from autoload.autoload_jobs aj,
              autoload.autoload_job_logs ajl,
              autoload.autoload_param_logs apl
         where
              aj.job_id = '3327686'
              and aj.last_success_date = ajl.log_end_time
              and  ajl.log_job_id = aj.job_id
              and apl.log_guid = ajl.guid
              and apl.name = 'FTP_TYPE'

select * from autoload.autoload_jobs where job_id = '3388167' or job_id = '3379163' -- guid = 1712C855C1904D2EE05354D81DAC2A4C -- 6098BD6F9587E311AE29B35564CC8219
select * from autoload.autoload_job_actions ja where ja.jobact_job_id = '3388167' and ja.jobact_action_enabled = 1
select * from autoload.dwf_action_processor_map apm 
where apm.action_guid = hextoraw('1712C855C1914D2EE05354D81DAC2A4C')
      and apm.name in ('File Writer','MultiFile Writer')  -- 1712C855C1944D2EE05354D81DAC2A4C
select * from dmi.config_settings cs where cs.id = hextoraw('1712C855C1944D2EE05354D81DAC2A4C') key in ('Filename','FilenameTemplate') -- 1714E435E8117E2FE05352D81DACF429
select * from dmi.config_setting_lines csl where csl.guid = hextoraw('FF4330D1A5AA61EEE04352D81DAC1E18')
select * from dmi.config_setting_lines csl where csl.guid = hextoraw('1714E435E8117E2FE05352D81DACF429')

select * from dmi.config_settings where id = hextoraw('0DBA2A14414E0DFAE05352D81DACABE8')
select * from dmi.config_settings where key_group = 'D132F35F4A29E411BF859A27E98FD7F2'
select * from dmi.config_setting_lines where value = 'CUST_FIRST_NAME'

--${ARCHIVE_DIRECTORY}/${FILE_NAME}
--${FILE_NAME_FULL}

-- query to get file names
select distinct ja.jobact_index action_num, 
       ja.jobact_comment action_comment, 
       apm.position dwf_processor_pos, 
       p.name processor_type, 
       apm.name processor_name, 
       apm.enabled processor_enabled,
       cs.id, cs.key_group, cs.key, csl.line, csl.value
  from autoload.autoload_jobs j, 
       autoload.autoload_job_actions ja, 
       autoload.dwf_action_processor_map apm, 
       autoload.dwf_processors p, 
       dmi.config_settings cs, 
       dmi.config_setting_lines csl 
 where ja.jobact_job_id = j.job_id 
   and apm.action_guid = ja.guid 
   and apm.processor_guid = p.guid 
   and j.job_id = '3352800'--:job_id 
   and cs.id = apm.guid 
   and csl.guid = cs.guid 
   and p.name in ('Database Query', 'Subordinate Database Query')
   and cs.key_group  = 'QUERY'
   and cs.key = 'SQL'
order by ja.jobact_index, apm.position, cs.key_group, cs.key, csl.line

select * from dmi.config_setting_lines where value = 'SFTP'
-- run time parameters
select * from autoload.variables where owner_guid = hextoraw('6098BD6F9587E311AE29B35564CC8219')
-- init vars
select * from autoload.autoload_param_logs 
where 1=1
and log_guid = hextoraw('F1ABFE30217D34FFE04352D81DAC78D4') 
and Name = 'FTP_TYPE'

select * from autoload.autoload_job_logs 
where 1=1
and log_job_id = '3379163' 
and log_failed = 0
and rownum = 1
order by log_start_time desc


select * from autoload.autoload_jobs aj,
              autoload.autoload_job_logs ajl
  where 1=1
    and aj.job_id = ajl.log_job_id
    and aj.last_success_date = ajl.log_start_time

select * from autoload.classes where guid = hextoraw('C7CD87E60EDD54A3E0340003BA22FC87') -- Export no parent_guid


select * from autoload.autoload_job_actions where guid = hextoraw('30EFCF909587E311AE29B35564CC8219')
select * from autoload.autoload_act_server_modules where id = 1000470465 --jobact_id
select * from autoload.autoload_act_server_modules where id = 3379163 --jobact_job_id
select * from autoload.autoload_act_server_modules where id = 3616089--jobact_misc_data
select * from autoload.autoload_act_server_modules where server_module_id = 10012

select * from autoload.autoload_server_modules where id = 1000470465
select * from autoload.autoload_server_modules where id = 3379163
select * from autoload.autoload_server_modules where code = 'DMI::Autoload::ServerModule::FTP::SecureFTP::put' -- id = 10012, GM 10664, ADP for GM 10665
select * from autoload.autoload_server_modules where code = 'DMI::Autoload::ServerModule::GPG::GpgCrypt::encrypt'  -- 742000013, memflush 742000015

-- query to see if encrypting
select *
  from autoload.autoload_jobs aj,
       autoload.autoload_job_actions aja,
       autoload.autoload_act_server_modules asm
  where 
       aj.job_id = '3379163'
       and aja.jobact_job_id = aj.job_id
       and aja.jobact_action_enabled = 1
       and aja.jobact_misc_data = asm.id
       and asm.server_module_id in (select id from autoload.autoload_server_modules where code = 'DMI::Autoload::ServerModule::GPG::GpgCrypt::encrypt')
       

-- query to see if SFTP
select *
  from autoload.autoload_jobs aj,
       autoload.autoload_job_actions aja,
       autoload.autoload_act_server_modules asm,
       autoload.variables av
  where 
       aj.job_id = '3379163'
       and aja.jobact_job_id = aj.job_id
       and aja.jobact_action_enabled = 1
       and aja.jobact_misc_data = asm.id
       and aj.guid = av.owner_guid
       and ((av.name = 'FTP_TYPE' and av.value = 'SFTP') or 
        (select * 
from autoload.autoload_job_logs ajl,
     autoload.autoload_param_logs apl 
where 1=1
and log_job_id = '3379163' 
and log_failed = 0
and rownum = 1
and apl.log_guid = ajl.guid
and apl.Name = 'FTP_TYPE'
and apl.resolved_value = 'SFTP'))
       and asm.server_module_id in (select id from autoload.autoload_server_modules where code = 'DMI::Autoload::ServerModule::FTP::SecureFTP::put')-- run time parameters
       
-- autoload variables
select * 
from autoload.autoload_job_logs ajl,
     autoload.autoload_param_logs apl 
where 1=1
and log_job_id = '3379163' 
and log_failed = 0
and rownum = 1
and apl.log_guid = ajl.guid
and apl.Name = 'FTP_TYPE'
and apl.resolved_value = 'SFTP'

order by log_start_time desc       
       
select * from autoload.variables where owner_guid = hextoraw('6098BD6F9587E311AE29B35564CC8219')
-- init vars
select * from autoload.autoload_param_logs 
where 1=1
and log_guid = hextoraw('F1ABFE30217D34FFE04352D81DAC78D4') 
and Name = 'FTP_TYPE'

select * from autoload.autoload_job_logs ajl where ajl.guid = hextoraw('F1ABFE30217D34FFE04352D81DAC78D4')

-- export jobs
select * 
from autoload.autoload_jobs aj,
     autoload.classes c 
where job_enabled = 1
 and  aj.job_class = c.legacy_id
     and ((c.guid = hextoraw('C7CD87E60EDD54A3E0340003BA22FC87')) or (c.parent_guid = hextoraw('C7CD87E60EDD54A3E0340003BA22FC87')))
select * from autoload.classes

       
--remote transfer action details      
select * from autoload.autoload_com_filetrans acf,
              autoload.autoload_com_filetrans_files acff
      where acf.ft_id = acff.file_ft_id
            and acf.ft_id = 24210
            and acff.is_destination_remote = 1

select * from autoload.autoload_job_actions aja where aja.jobact_misc_data = 24210

select * from autoload.classes 
 where name like '%Export%' order by name 

select aj.job_id, c.guid, c.name, c.parent_guid 
 from autoload.autoload_jobs aj,
      autoload.classes c
 where aj.job_class = c.legacy_id
       and aj.job_id = '3385762' -- 908575F1087BDF11AE5FDCDEEB6E5CDC  Vehicle Inventory 1.2 DRE Program Export - Data With IMS and Stock Images  103E02FF2FF8DB1180408777B0F87768

select * from autoload.classes where guid = hextoraw('C7CD87E60EE554A3E0340003BA22FC87')

select * from autoload.autoload_job_logs where guid = hextoraw('0000A2306BC52163E05352D81DACC4F0')

select * 
from dmi_rpts.sensitive_field_list 
order by 1 asc

select max(legacy_id) from autoload.classes
select * from autoload.classes where legacy_id = 2031802314 for update  --50B8ADDB2066E51188E9AE0E8C00B046
select * from autoload.job_class_config where class_guid = hextoraw('50B8ADDB2066E51188E9AE0E8C00B046')
select * from autoload.variables where owner_guid = hextoraw('50B8ADDB2066E51188E9AE0E8C00B046')

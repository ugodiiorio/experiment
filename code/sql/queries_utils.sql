select * from kte_target.premiums where key_company_id_str = 'genialloyd' and key_insurance_profiles_id_num in (select key_insurance_profiles_id_num from kte_target.rate_parameters where car_preparation_str like '@ALTERNATE%' and key_company_id_str = 'genialloyd')
select * from kte_monitor.scheduler where key_company_id_str = 'genialloyd' and key_insurance_profiles_id_num in (select key_insurance_profiles_id_num from kte_target.rate_parameters where car_preparation_str like '@ALTERNATE%' and key_company_id_str = 'genialloyd')

delete from kte_target.premiums where key_company_id_str = 'genialloyd' and key_insurance_profiles_id_num in (select key_insurance_profiles_id_num from kte_target.rate_parameters where car_preparation_str like '@ALTERNATE%' and key_company_id_str = 'genialloyd')
delete from kte_monitor.scheduler where key_company_id_str = 'genialloyd' and key_insurance_profiles_id_num in (select key_insurance_profiles_id_num from kte_target.rate_parameters where car_preparation_str like '@ALTERNATE%' and key_company_id_str = 'genialloyd')
delete from kte_target.rate_parameters where car_preparation_str like '@ALTERNATE%' and key_company_id_str = 'genialloyd'

delete from kte_target.rate_parameters where key_company_id_str = 'dialogo'
delete from kte_target.premiums where key_company_id_str = 'dialogo'
delete from kte_monitor.scheduler where key_company_id_str = 'dialogo'


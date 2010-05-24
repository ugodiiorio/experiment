
sectors=("sect_1")
companies=("directline" "genertel" "linear" "quixa" "zurich_connect")
sectors_x_companies=(
"Direct Line - Auto" "Genertel - Auto" "Linear - Auto" "Quixa - Auto" "Zurich Connect - Auto" 
)

cd /home/notroot/git/KTE/code/builders/etl/1_generic_profile/script


# fieldmapping
#mysql -u root -pkub01d --database=kte_driver -e "delete from field_mapping"
for i in ${sectors[@]}; do
sed s/"sector_placeholder"/$i/g /home/notroot/git/KTE/code/yamls_TW/field_mapping.yml >temp1
ruby build_field_mapping.rb temp1
rm temp1
done

# profile
mysql -u root -pkub01d --database=kte_driver -e "delete from insurance_profiles"
count=0
for i in ${sectors[@]}; do
	for j in ${companies[@]}; do
	sed s/"sector_placeholder"/"$i"/g /home/notroot/git/KTE/code/yamls_TW/profile.yml |sed s/"company_provider_placeholder"/"${sectors_x_companies[$count]}"/g |sed s/"company_group_placeholder"/""$j"_provider_2"/g >temp2
	ruby build_profile.rb temp2
	rm temp2
	let count++
	done
done


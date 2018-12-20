ActiveAdmin.register Restaurant do
	permit_params :name, :description, :picture

	form do |f|
		f.inputs do
			f.input :name
			f.input :description
			if restaurant.picture.attached?
      	f.input :picture, :as => :file,
        	:hint => image_tag(
          	url_for(
            f.object.picture.variant(combine_options: { gravity: 'Center', crop: '250x250+0+0' })
            )
          )
      else
      	f.input :picture, :as => :file
      end
		end
		f.actions
	end

 
	index do
		selectable_column
		id_column
		column :picture do |restaurant|
			if restaurant.picture.attached?
				image_tag restaurant.picture.variant(combine_options: { gravity: 'Center', crop: '250x250+0+0' })
			end
		end
		column :name do |restaurant|
			link_to restaurant.name, admin_restaurant_path(restaurant)
		end
		actions
	end

	show do 
		attributes_table do
			row :image do |restaurant|
				if restaurant.picture.attached?
					image_tag restaurant.picture.variant(combine_options: { gravity: 'Center', crop: '250x250+0+0' })
				end
			end
			row :name
			row :description
		end
		active_admin_comments
	end
end
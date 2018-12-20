ActiveAdmin.register Dish do
	permit_params :name, :description, :picture, :price, :restaurant_id

	form do |f|
		f.inputs do
			f.input :name
			f.input :price
			f.input :description
			f.input :restaurant
			if dish.picture.attached?
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
		column :picture do |dish|
			if dish.picture.attached?
				image_tag dish.picture.variant(combine_options: { gravity: 'Center', crop: '250x250+0+0' })
			end
		end
		column :name do |dish|
			link_to dish.name, admin_restaurant_path(dish)
		end
		actions
	end

	show do 
		attributes_table do
			row :image do |dish|
				if dish.picture.attached?
					image_tag dish.picture.variant(combine_options: { gravity: 'Center', crop: '250x250+0+0' })
				end
			end
			row :name
			row :description
			row :price
		end
		active_admin_comments
	end
end

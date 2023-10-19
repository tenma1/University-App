ActiveAdmin.register Gallery do
  belongs_to :college, optional: true
  belongs_to :school, optional: true
  belongs_to :hostel, optional: true

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :imageable_type, :imageable_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:imageable_type, :imageable_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    # id_column
      column 'Instituion Type', :imageable_type
      column 'Instituion Name', :imageable
      actions 
  end

  

  form do |f|
    f.inputs do 
      imageable_type = ['College', 'School', 'Hostel']
      f.input :imageable_type, as: :select, collection: imageable_type, label: 'Instituion Type'
      f.input :imageable_id, as: :select, collection: College.all+School.all+Hostel.all, label: 'Instituion'
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end



    show do
      attributes_table do
        if resource.images.present?
          row "Images(#{resource.images.count})" do 
            div do
              resource.images.each do |img|
                 span do
                   image_tag url_for(img),size:"200x200"
                 end
              end
            end 
          end
        end
      end
    end
  
end

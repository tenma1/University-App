ActiveAdmin.register College do
  # config.create_another = true
  # sidebar 'College Details' do
  #   ul do
  #     li link_to 'Hostel', admin_college_hostels_path('hostels')
  #   end
  # end

  # actions :all, except: [:delete, :update, :destroy]
  # actions :all, only: :view        # not working

  filter :city
  filter :discipline
  filter :rating

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  
  # actions :index, :create, :edit, :update, :destroy

  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :rating, :address, :pincode, :city, :discipline, feature_ids: [], hostels_attributes: [:id, :name, :capacity, :residential_type, :residable_type, :residable_id, facility_ids: []], gallery_attributes: [ :imageable_type, :imageable_id, images: []]
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :rating]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

   #  menu label: "College Data"

    index do
      selectable_column
        id_column
        column :name
        column :discipline
        column :rating
        column :city
        actions 
    end

    form do |f|
      f.inputs 'Details' do
        f.input :name
        f.input :discipline
        f.input :rating#, as: :select
        f.input :address
        f.input :city
        f.input :pincode
        # f.input :hostels, as: :select, collection: Hostel.all
        # collected_data = Feature.all.map{|x| [x.name, x.id, {checked: f.object.features.ids.include?(x.id.to_s)}]}
        f.input :features, as: :check_boxes, collection: Feature.all #collected_data
        # f.input :college_images,as: :file, input_html: { multiple: true }

        f.has_many :gallery, heading: 'Pictures',
          new_record: 'Add Pictures',
          allow_destroy: true do |t|
            t.input :images,as: :file, input_html: { multiple: true }
          end

      end

      f.inputs "Associated Hostel" do
        f.has_many :hostels,
          new_record: 'New Hostel',
          remove_record: 'Remove Hostel',
          allow_destroy: true do |b|
            b.input :name
            residential_type = ['Co-Ed', 'Boys', 'Girls']
            b.input :residential_type, as: :select, collection: residential_type
            b.input :capacity
            b.input :facilities, as: :check_boxes, collection: Facility.all
          end
      end

      f.actions
    end


    show do
      attributes_table do
        
        row :name
        row :discipline
        row :rating
        row :address
        row :city
        row :pincode
        row :hostels
        row :features
        row('College Pictures') {|r| r.gallery }
        # if resource.gallery.images.present?
        #   row "Images(#{resource.gallery.images.count})" do 
        #     div do
        #       resource.gallery.images.each do |img|
        #          span do
        #            image_tag url_for(img),size:"200x200"
        #          end
        #       end
        #     end 
        #   end
        # end

      end
    end

end

# /home/rails-16/rails_work/demo_admin/app/assets/images/Hogwarts_Logo.jpeg
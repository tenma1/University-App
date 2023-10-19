ActiveAdmin.register Hostel do
  belongs_to :college, optional: true
  belongs_to :school, optional: true

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :capacity, :residential_type, :residable_type, :residable_id, facility_ids: [], gallery_attributes: [ :imageable_type, :imageable_id, images: []]
  # permit_params :name, :capacity, :residential_type, :college_id, facility_ids: []

  # or
  #
  # permit_params do
  #   permitted = [:name, :capacity, :residential_type, :residable_type, :residable_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted



  filter :residential_type
  residable_type = ['College', 'School']
  filter :residable_type, as: :select, collection: residable_type, label: 'Institution'
  filter :residable_id, as: :select, collection: College.all+School.all
  # filter :available_seats     # method to count current capacity not available right now
  
  index do
    selectable_column
    id_column
      column :name
      column :residential_type
      column :capacity
      actions 
  end
  
  form do |f|
    f.inputs do
      f.input :name
      residable_type = ['College', 'School']
      f.input :residable_type, as: :select, collection: residable_type
      f.input :residable_id, as: :select, collection: College.all+School.all
      residential_type = ['Co-Ed', 'Boys', 'Girls']
      f.input :residential_type, as: :select, collection: residential_type
      f.input :capacity
      f.input :facilities, as: :check_boxes, collection: Facility.all

      f.has_many :gallery, heading: 'Pictures',
          new_record: 'Add Pictures',
          remove_record: 'Remove Pictures',
          allow_destroy: true do |t|
            t.input :images,as: :file, input_html: { multiple: true }
          end
    end
    f.actions
  end

  show do
    # attributes_table do |f|
    attributes_table do
      row :name
      row :residable_type, as: 'Associated College'
      row :residential_type
      row :capacity
      # row :available_seats
      row :facilities
      row :gallery
    end
  end
  
end

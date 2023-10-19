ActiveAdmin.register School do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :rating, :medium, :affiliation, :address, :city, :pincode, feature_ids:[], hostels_attributes: [:id, :name, :capacity, :residential_type, :residable_type, :residable_id, facility_ids: []], gallery_attributes: [ :imageable_type, :imageable_id, images: []]
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :rating, :medium, :affiliation, :address, :city, :pincode]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :city
  filter :discipline
  filter :rating

  index do
    selectable_column
    id_column
      column :name
      column :medium
      column :affiliation
      column :rating
      column :city
      actions 
  end
  
  form do |f|
    f.inputs 'Details' do
      f.input :name
      valid_mediums = ['English', 'Other']
      affiliations = ['CBSE', 'ICSE', 'NIOS', 'IB', 'CISCE', 'State']
      f.input :affiliation, as: :select, collection: affiliations
      f.input :medium, as: :select, collection: valid_mediums
      f.input :rating
      f.input :address
      f.input :city
      f.input :pincode
      f.input :features, as: :check_boxes, collection: Feature.all
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
        allow_destrby: true do |b|
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
    # attributes_table do |f|
    attributes_table do
      row :name
      row :medium
      row :affiliation
      row :rating
      row :address
      row :city
      row :pincode
      row :features
      row :hostels
      row('School Pictures') {|r| r.gallery }
    end
  end
end

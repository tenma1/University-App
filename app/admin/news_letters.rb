ActiveAdmin.register NewsLetter do

  permit_params :title, :post_no, :brief_info, :detailed_info, college_ids:[], school_ids:[], hostel_ids:[]
 
  # permit_params do
  #   permitted = [:title, :post_no, :brief_info, :detailed_info]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :title

  index do
    selectable_column
    column :title
    column :post_no
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :brief_info
      f.input :detailed_info
      f.input :colleges, as: :check_boxes, collection: College.all
      f.input :schools, as: :check_boxes, collection: School.all
      f.input :hostels, as: :check_boxes, collection: Hostel.all
    end
    f.actions
  end

  show do
    attributes_table do
      row :post_no, as: 'Post'
      row :title
      row :brief_info
      row :detailed_info
      row :colleges, as: 'Associated Colleges'
      row :schools, as: 'Associated Schools'
      row :hostels, as: 'Associated Hostels'
    end
  end

end

ActiveAdmin.register Accounting do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :total_value, :current_due, :credited, :other_details, :other_charges, :details, :razorpay_order_id, :user_id

  index do
    selectable_column
    column 'Users', :user
    actions
  end

  form do |f|
    f.inputs 'Details:' do
      f.input :total_value
      f.input :current_due
      f.input :details
      f.input :credited
      f.input :other_charges
      f.input :other_details
      f.input :user_id, as: :select, collection: User.all, label: 'User'
    end
    f.actions
  end

  show do
    attributes_table do
      row :user
      row :total_value
      row :current_due
      row :details, as: 'Details'
      row :other_charges
      row :other_details, as: 'Other Charges\' Details'
      row :credited, as: 'Credited'
    end
  end
  
end

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :age, :institution_type, :discipline, :subject, :standard, :role_id, :college_id, :hostel_id, :school_id, :approved

  filter :name
  filter :role.name
  filter :college.name
  index do
    selectable_column
    # id_column
    column :name 
    column :age 
    column :role
    column :institution_type
    column :approved
    actions
  end


  # filter :created_at

  form do |f|
    f.inputs 'Details:' do
      f.input :role_id, as: :select, collection: Role.all
      # f.input :password_confirmation
      f.input :name
      f.input :age
      f.input :email
      f.input :password

      div class: 'Instituion' do
        institution_type = ['College', 'School']
        f.input :institution_type, as: :select, collection: institution_type
      end

      div class: 'College' do
        f.input :college_id, as: :select, collection: College.all
      end

      div class: 'School' do
        f.input :school_id, as: :select, collection: School.all
      end

      div class: 'Teacher_Student' do
        f.input :discipline
      end

      div class: 'Teacher' do
        f.input :subject
      end

      div class: 'Student' do
        f.input :standard
      end

      div class: 'Student_Warden' do
        f.input :hostel_id, as: :select, collection: Hostel.all
      end

      f.input :approved


    end
    f.actions
  end

  show do
    attributes_table do
      row :role.name, as: 'Status'
      row :name
      row :age
      row :email

      var = user.role.name

      if (user.institution_type == 'College')
        row :institution_type
        row :college.name
      elsif (user.institution_type == 'School')
        row :institution_type
        row :school.name
      end

      if (var == "Principal")  #var = user.role_id, Role.find(var).name == '--'

      elsif (var == 'Teacher')
        row :discipline
        row :subject
      elsif (var == 'Student')
        row :discipline
        row :standard
        row :hostel.name
      elsif (var == 'Warden')
        row :hostel.name
      end
      row :approved

    end
  end

  # controller do
  #   def create
  #     debugger
  #   end
  # end

end

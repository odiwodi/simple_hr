ActiveAdmin.register Employee do
  menu priority: 2
  permit_params :first_name, :middle_name, :last_name, :gender_id, :birth_date, :is_deleted,
                :marital_status
  
  index do
    selectable_column
    id_column
    column "Full Name" do |employee|
      "#{employee.last_name}, #{employee.first_name} #{employee.middle_name}"
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :last_name
      f.input :first_name
      f.input :middle_name
      f.input :gender_id, as: :select, collection: Gender.all.collect { |g| [g.name, g.id] }
      f.input :birth_date, as: :datepicker
      f.input :marital_status, as: :select, collection: Employee.marital_statuses.invert
    end
    f.actions
  end

  show do
    tabs do
      tab "Overview" do
        attributes_table title: nil do
          row :id
          row :last_name
          row :first_name
          row :middle_name
          row :gender do |employee|
            employee.gender&.name
          end
          row :birth_date
          row(:age, &:age)
          row :marital_status do |employee|
            Employee.marital_statuses[employee.marital_status]
          end
          row :created_at
          row :updated_at
        end
      end
    end
  end

end

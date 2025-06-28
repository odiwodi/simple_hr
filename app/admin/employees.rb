ActiveAdmin.register Employee do
  menu priority: 2
  permit_params :first_name, :middle_name, :last_name, :gender_id, :birth_date, :is_deleted,
                :marital_status, :date_of_joining, :employment_type, :job_title, :designation_id,
                :department_id, :initial_salary, :mobile_number, :email_address, :company_email_address,
                :current_address, :permament_address,
                emergency_contacts_attributes: [:id, :name, :phone_number, :relationship, :_destroy]
  
  filter :id
  filter :last_name
  filter :first_name
  filter :middle_name
  filter :marital_status, as: :select, collection: Employee.marital_statuses.invert
  filter :department, as: :select, collection: Department.all.collect { |d| [d.name, d.id] }
  filter :job_title
  filter :date_of_joining

  scope :all, default: true
  Department.all.each do |department|
    scope(department.name) { |scope| scope.where(department_id: department.id) }
  end

  index do
    selectable_column
    id_column
    column "Full Name" do |employee|
      "#{employee.last_name}, #{employee.first_name} #{employee.middle_name}"
    end
    actions
  end

  form do |f|
    f.inputs "Overview" do
      f.input :last_name
      f.input :first_name
      f.input :middle_name
      f.input :gender_id, as: :select, collection: Gender.all.collect { |g| [g.name, g.id] }
      f.input :birth_date, as: :datepicker
      f.input :marital_status, as: :select, collection: Employee.marital_statuses.invert
    end
    f.inputs "Joining" do
      f.input :date_of_joining, as: :datepicker
      f.input :employment_type
      f.input :job_title
      f.input :designation_id, as: :select, collection: Designation.all.collect { |d| [d.name, d.id] }, include_blank: true
      f.input :department_id, as: :select, collection: Department.all.collect { |d| [d.name, d.id] }, include_blank: true
      f.input :initial_salary
    end
    f.inputs "Address and Contacts" do
      f.input :mobile_number
      f.input :email_address
      f.input :company_email_address
      f.input :current_address
      f.input :permament_address
      f.has_many :emergency_contacts, allow_destroy: true, allow_new: true, heading: "Emergency Contacts" do |ec|
        ec.input :name
        ec.input :phone_number
        ec.input :relationship, as: :select, collection: EmergencyContact::RELATIONSHIP_OPTIONS, include_blank: true
      end
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
      tab "Joining" do
        attributes_table title: nil do
          row :date_of_joining
          row :employment_type
          row :job_title
          row :designation
          row :department
            row :initial_salary do |employee|
            number_to_currency(employee.initial_salary, unit: "₱", precision: 2)
            end
        end
      end
      tab "Address and Contacts" do
        attributes_table title: nil do
          row :mobile_number
          row :email_address
          row :company_email_address
          row :current_address
          row :permament_address
          row "Emergency Contacts" do |employee|
            if employee.emergency_contacts.any?
              table_for employee.emergency_contacts do
              column :name
              column :phone_number
              column :relationship
              end
            else
              span "No emergency contacts available"
            end
          end
        end
      end
    end
  end

  member_action :destroy, method: :delete do
    resource.update(is_deleted: true)
    redirect_to admin_employees_path, notice: "Employee was successfully deleted."
  end

  controller do
    def scoped_collection
      super.where(is_deleted: [false, nil])
    end
  end
end

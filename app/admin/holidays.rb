ActiveAdmin.register Holiday do
  menu parent: "Configuration"
  permit_params :name, :date, :holiday_type, :description, :is_recurring
  
  index do
    selectable_column
    id_column
    column :name
    column :date
    column("Holiday Type") { |holiday| Holiday.holiday_types[holiday.holiday_type] }
    column :is_recurring
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :date, as: :datepicker
      f.input :holiday_type, as: :select, collection: Holiday.holiday_types.invert
      f.input :description, input_html: { rows: 5 }
      f.input :is_recurring
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :date
      row("Holiday Type") { |holiday| Holiday.holiday_types[holiday.holiday_type] }
      row :description
      row :is_recurring
      row :created_at
      row :updated_at
    end
  end
end

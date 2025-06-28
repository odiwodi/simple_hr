ActiveAdmin.register Violation do
  menu parent: "Configuration"
  permit_params :name, :description, :severity_level, :default_sanction,
                :number_of_offenses_strike, :status

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :severity_level do |violation|
      violation.severity_level&.humanize
    end
    column :default_sanction do |violation|
      violation.default_sanction&.humanize
    end
    column :number_of_offenses_strike
    column :status
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description, as: :text, input_html: { rows: 8 }
      f.input :severity_level, as: :select, collection: Violation.severity_levels.invert
      f.input :default_sanction, as: :select, collection: Violation.default_sanctions.invert
      f.input :number_of_offenses_strike
      f.input :status
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :severity_level do |violation|
        violation.severity_level&.humanize
      end
      row :default_sanction do |violation|
        violation.default_sanction&.humanize
      end
      row :number_of_offenses_strike
      row :status
      row :created_at
      row :updated_at
    end
  end
end

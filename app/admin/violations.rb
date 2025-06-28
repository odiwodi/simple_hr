ActiveAdmin.register Violation do
  menu parent: "Configuration"
  permit_params :name, :description, :severity_level, :default_sanction,
                :number_of_offenses_strike, :status

  form do |f|
    f.inputs do
      f.input :name
      f.input :description, as: :text, input_html: { rows: 8 }
      f.input :severity_level, as: :select, collection: Violation.severity_levels.values
      f.input :default_sanction, as: :select, collection: Violation.default_sanctions.values
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

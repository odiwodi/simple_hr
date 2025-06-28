ActiveAdmin.register Shift do
  menu parent: "Configuration"
  permit_params :name, :time_in, :time_out, :break_start_time, :break_end_time, :grace_period, working_days: []

  filter :name
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :time_in, as: :time_picker
      f.input :time_out, as: :time_picker
      f.input :break_start_time, as: :time_picker
      f.input :break_end_time, as: :time_picker
      f.input :grace_period
      f.input :working_days, as: :check_boxes, collection: Shift::DAYS_OF_WEEK
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column(:time_in) { |shift| shift.time_in&.strftime("%H:%M") }
    column(:time_out) { |shift| shift.time_out&.strftime("%H:%M") }
    column(:break_start_time) { |shift| shift.break_start_time&.strftime("%H:%M") }
    column(:break_end_time) { |shift| shift.break_end_time&.strftime("%H:%M") }
    column :grace_period
    column :working_days
    actions
  end

  show do
    attributes_table do
      row :name
      row(:time_in) { |shift| shift.time_in&.strftime("%H:%M") }
      row(:time_out) { |shift| shift.time_out&.strftime("%H:%M") }
      row(:break_start_time) { |shift| shift.break_start_time&.strftime("%H:%M") }
      row(:break_end_time) { |shift| shift.break_end_time&.strftime("%H:%M") }
      row(:shift_duration) do |shift|
        duration = shift.shift_duration
        if duration
          hours = duration.div(60)
          minutes = duration % 60
          minutes = minutes.to_i # Remove decimal part if any
          parts = []
          parts << "#{hours} hours" if hours > 0
          parts << "#{minutes} minutes" if minutes > 0
          parts.empty? ? "-" : parts.join(" ")
        else
          "-"
        end
      end
      row :grace_period
      row :working_days
      row(:rest_days) do |shift|
        shift.rest_days.join(", ")
      end
    end
  end
end

ActiveAdmin.register Shift do
  menu parent: "Configuration"
  permit_params :name, :time_in, :time_out, :break_start_time, :break_end_time, :grace_period, working_days: []
  
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
end

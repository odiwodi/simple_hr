ActiveAdmin.register JobLevel do
  menu parent: "Configuration"
  permit_params :position_name, :position_code, :level_rank, :description
  
end

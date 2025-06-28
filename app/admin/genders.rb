ActiveAdmin.register Gender do
  menu parent: "Configuration"
  permit_params :name
  
end

# app/admin/departments.rb
ActiveAdmin.register Department do
  menu parent: "Configuration"
  permit_params :name, :code, :payroll_cost_center, :location, :status

end
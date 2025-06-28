ActiveAdmin.register Designation do
  menu parent: "Configuration"
  permit_params :name, :department_id, :job_level_id, :payroll_cost_center

  
end

class EmployeeCompanyHistory < ApplicationRecord
  belongs_to :department
  belongs_to :designation
  belongs_to :employee
end

class AuthorizedUser < ActiveRecord::Base
  belongs_to :patient
  
  validates :email, :uniqueness => { :scope => :patient_id }
end

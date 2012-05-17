module BelongsToPatient
  def find_patient
    @patient = Patient.accessible_to(current_user.email).find(params[:patient_id])
  end
  
  def self.included(mod)
    mod.class_eval do
      include ApplicationHelper
      before_filter :find_patient
    end
  end
end
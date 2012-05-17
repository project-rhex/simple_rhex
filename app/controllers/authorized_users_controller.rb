require 'belongs_to_patient'

class AuthorizedUsersController < ApplicationController
  include BelongsToPatient
  
  def create
    au = AuthorizedUser.new(params[:authorized_user])
    au.patient = @patient
    au.save
  end

  def destroy
  end
end

require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  test 'users can only see patients they have access to' do
    assert_equal 2, Patient.accessible_to('andy@mitre.org').count
    assert_equal 2, Patient.accessible_to('steve@mitre.org').count
    assert_equal 0, Patient.accessible_to('foo@mitre.org').count
  end
end

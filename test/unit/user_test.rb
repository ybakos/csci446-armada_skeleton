require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should be rendered as full name when rendered as a string" do
    u = User.first
    assert_equal u.full_name, u.to_s
  end
  
  test "should always require a role" do
    u = User.first
    u.role = nil
    assert !u.valid?
  end

  test "should assign default member role upon creation if none is assigned" do
    u = User.create(:first_name => 'John',
                    :last_name => 'Doe',
                    :email => 'test@test.net',
                    :password => 'password',
                    :password_confirmation => 'password')
    assert_equal Role.find_by_name('member'), u.role
  end
  
end


# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  first_name          :string(255)     not null
#  last_name           :string(255)     not null
#  email               :string(255)     not null
#  role_id             :integer         not null
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  perishable_token    :string(255)     not null
#  login_count         :integer         default(0), not null
#  failed_login_count  :integer         default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#


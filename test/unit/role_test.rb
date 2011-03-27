require 'test_helper'

class RoleTest < ActiveSupport::TestCase

  test "should not save role without name" do
    r = Role.new
    assert !r.save
    r = Role.new(:name => '')
    assert !r.save
    r = Role.new(:name => ' ')
    r.save
  end
  
  test "name should not have surrounding whitespace" do
    r = Role.new(:name => ' can i haz role ')
    assert_equal r.name, 'can i haz role'
  end
  
  test "name should be all lower case" do
    r = Role.new(:name => 'CapiTalIzed')
    assert_equal r.name, 'capitalized'
  end
  
  test "should not save role with nonunique name" do
    name = Faker::Lorem.words[0]
    Role.create!(:name => name)
    assert_raise(ActiveRecord::RecordInvalid) {Role.create!(:name => name)}
  end
  
  test "should use name when rendered as a string" do
    name = Faker::Lorem.words[0]
    r = Role.new(:name => name)
    assert_equal r.to_s, name
  end

end



# == Schema Information
#
# Table name: roles
#
#  id          :integer         not null, primary key
#  name        :string(255)     not null
#  description :string(255)
#  users_count :integer         default(0)
#  created_at  :datetime
#  updated_at  :datetime
#


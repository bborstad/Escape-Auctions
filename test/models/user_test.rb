# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  password               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  #Presence tests
  test "email presence not valid" do
    u = users(:one)
    u.email = nil
    assert_not u.valid?
    u.email = ""
    assert_not u.valid?
  end
  
  test "username presence not valid" do
    u = users(:one)
    u.username = nil
    assert_not u.valid?
    u.username = ""
    assert_not u.valid?
  end
  
  test "password presence not valid" do
    u = users(:one)
    u.password= nil
    assert_not u.valid?
    u.password = ""
    assert_not u.valid?
  end

  #Uniqueness tests
  test "email uniqueness not valid" do
    one = users(:one)
    two = users(:two)
    one.email = two.email
    assert_not one.valid?
  end

  test "username uniqueness not valid" do
    one = users(:one)
    two = users(:two)
    one.username = two.username
    assert_not one.valid?
  end

  test "password uniqueness not valid" do
    one = users(:one)
    two = users(:two)
    one.password = two.password
    assert_not one.valid?
  end
  
end

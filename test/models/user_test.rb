require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User should not without params" do
    user = User.new
    assert !user.valid?, "User without params should not be"
  end
  test "User should correct email" do
    user = User.new(email: "email@mail.ru", password: "password")
    user2 = User.new(email: "mail.ru", password: "password")
    assert user.valid?,"User should correct email"
    assert !user2.valid?, "User with not correct email should be invalid"
  end
  test "User should have correct password" do 
    user = User.new(email: "email@mail.ru", password: "1")
    user2 = User.new(email: "email@mail.ru", password: "password") 
    assert !user.valid?, "user with password less than 6 simbols should be invalid"
    assert user2.valid?  "user with correct password should be valid"
  end
end

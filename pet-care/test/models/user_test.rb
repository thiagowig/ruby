require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Java", email: "dev.thiago@gmail.com", password: "123")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "name must be present" do
    @user.name = nil
    assert @user.invalid?
  end

  test "email must be present" do
    @user.email = nil
    assert @user.invalid?
  end

  test "email must be in the correct format" do
    @user.email = "thiago"
    assert @user.invalid?
  end

  test "email must be unique" do
    @user.save
    second_user = User.new(name: "Java", email: "dev.thiago@gmail.com", password: "123")
    assert second_user.invalid?
  end

end

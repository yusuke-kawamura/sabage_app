require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", 
                     password: "123456", password_confirmation: "123456")
  end
  
  test "有効なユーザー" do
    assert @user.valid?
  end

  test "ユーザー名が空白" do
    @user.name = "    "
    assert_not @user.valid?
  end
  
  test "ユーザー名の長さ" do
    @user.name = "a" * 31
    assert_not @user.valid?
  end
  
  test "パスワードが空白" do
    @user.password = @user.password_confirmation = "" * 6
    assert_not @user.valid?
  end
  
  test "パスワードが6文字以下" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end

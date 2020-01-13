require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "無効なユーザー登録" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                        password: "123456",
                                        password_confirmation: "123456",
                                        Activity_area:"",
                                        like_weapon:""} }
      end
      assert_template 'users/new'
    end
    
    test "有効なユーザー登録" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Sabage Life",
                                        password: "123456",
                                        password_confirmation: "123456",
                                        Activity_area:"",
                                        like_weapon:""} }
      end
      follow_redirect!
      assert_template 'users/show'
    end
end

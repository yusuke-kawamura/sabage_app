require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "レイアウトへのリンク確認" do
    get root_path
    assert_template 'top_page/home'
    assert_select "a[href=?]", root_path
  end
end

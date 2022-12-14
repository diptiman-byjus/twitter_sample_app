require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "create should require logged-in user" do
    assert_no_difference 'Relationship.count' do
      post relationships_url
    end
    assert_redirected_to login_url
  end

  test "destroy should require logged-in user" do
    assert_no_difference 'Relationship.count' do
      delete '/relationships/:id', params: {id: relationships(:one)}
    end
    assert_redirected_to login_url
  end
end

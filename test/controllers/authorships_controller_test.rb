require 'test_helper'

class AuthorshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @authorship = authorships(:one)
  end

  test "should get index" do
    get authorships_url, as: :json
    assert_response :success
  end

  test "should create authorship" do
    assert_difference('Authorship.count') do
      post authorships_url, params: { authorship: { article_id: @authorship.article_id, user_id: @authorship.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show authorship" do
    get authorship_url(@authorship), as: :json
    assert_response :success
  end

  test "should update authorship" do
    patch authorship_url(@authorship), params: { authorship: { article_id: @authorship.article_id, user_id: @authorship.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy authorship" do
    assert_difference('Authorship.count', -1) do
      delete authorship_url(@authorship), as: :json
    end

    assert_response 204
  end
end

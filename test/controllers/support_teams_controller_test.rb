require "test_helper"

class SupportTeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @support_team = support_teams(:one)
  end

  test "should get index" do
    get support_teams_url
    assert_response :success
  end

  test "should get new" do
    get new_support_team_url
    assert_response :success
  end

  test "should create support_team" do
    assert_difference("SupportTeam.count") do
      post support_teams_url, params: { support_team: { branch: @support_team.branch, email: @support_team.email, image: @support_team.image, name: @support_team.name, phone_number: @support_team.phone_number, role: @support_team.role } }
    end

    assert_redirected_to support_team_url(SupportTeam.last)
  end

  test "should show support_team" do
    get support_team_url(@support_team)
    assert_response :success
  end

  test "should get edit" do
    get edit_support_team_url(@support_team)
    assert_response :success
  end

  test "should update support_team" do
    patch support_team_url(@support_team), params: { support_team: { branch: @support_team.branch, email: @support_team.email, image: @support_team.image, name: @support_team.name, phone_number: @support_team.phone_number, role: @support_team.role } }
    assert_redirected_to support_team_url(@support_team)
  end

  test "should destroy support_team" do
    assert_difference("SupportTeam.count", -1) do
      delete support_team_url(@support_team)
    end

    assert_redirected_to support_teams_url
  end
end

require "application_system_test_case"

class SupportTeamsTest < ApplicationSystemTestCase
  setup do
    @support_team = support_teams(:one)
  end

  test "visiting the index" do
    visit support_teams_url
    assert_selector "h1", text: "Support teams"
  end

  test "should create support team" do
    visit support_teams_url
    click_on "New support team"

    fill_in "Branch", with: @support_team.branch
    fill_in "Email", with: @support_team.email
    fill_in "Image", with: @support_team.image
    fill_in "Name", with: @support_team.name
    fill_in "Phone number", with: @support_team.phone_number
    fill_in "Role", with: @support_team.role
    click_on "Create Support team"

    assert_text "Support team was successfully created"
    click_on "Back"
  end

  test "should update Support team" do
    visit support_team_url(@support_team)
    click_on "Edit this support team", match: :first

    fill_in "Branch", with: @support_team.branch
    fill_in "Email", with: @support_team.email
    fill_in "Image", with: @support_team.image
    fill_in "Name", with: @support_team.name
    fill_in "Phone number", with: @support_team.phone_number
    fill_in "Role", with: @support_team.role
    click_on "Update Support team"

    assert_text "Support team was successfully updated"
    click_on "Back"
  end

  test "should destroy Support team" do
    visit support_team_url(@support_team)
    click_on "Destroy this support team", match: :first

    assert_text "Support team was successfully destroyed"
  end
end

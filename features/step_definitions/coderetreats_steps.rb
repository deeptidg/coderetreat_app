Given(/^there are no coderetreats running today$/) do
  Coderetreat.destroy_all
end

Given(/^there are some coderetreats running today$/) do
  @coderetreats = [
    Coderetreat.create!(status: "not_started", location: "Chicago"),
    Coderetreat.create!(status: "not_started", location: "Seattle"),
    Coderetreat.create!(status: "in_session", location: "Berlin")
  ]
end


When(/^I go to the running coderetreats display page$/) do
  visit running_today_coderetreats_url
end

Then(/^I should see that there are no coderetreats running$/) do
  expect(page).to have_content("There are no coderetreats running today.")
end


Then(/^I should see the running coderetreats grouped by status$/) do
  @coderetreats.each do |coderetreat|
    within(".#{coderetreat.status}") do
      puts "Status = #{coderetreat.status}, Location= #{coderetreat.location}"
      expect(page).to have_css(".coderetreat", text: coderetreat.location)
    end
  end
end

Given(/^a coderetreat that has not started$/) do
  @coderetreat =  Coderetreat.create! status: "not_started", location: "Chicago"
  puts "The coderetreat status when created is #{@coderetreat.status} and id is #{@coderetreat.id}"
end

When(/^I start the coderetreat$/) do
  visit edit_coderetreat_status_url(@coderetreat)
  click_on "In Session"
end

Then(/^I should see that the coderetreat is in session$/) do
  puts "The coderetreat status after update is #{@coderetreat.status} for id #{@coderetreat.id}"
  expect(page).to have_css(".in_session .coderetreat", text: @coderetreat.location)
end

Given(/^a coderetreat that is in session$/) do
  @coderetreat = Coderetreat.create! status: "in_session", location: "Chicago"
end

When(/^I start a break for the coderetreat$/) do
  visit edit_coderetreat_status_url(@coderetreat)
  click_on "On Break"
end

When(/^I go to running coderetreats display page$/) do
end

Then(/^I should see that the coderetreat is on break$/) do
  expect(page).to have_css(".on_break .coderetreat", text: @coderetreat.location)
end











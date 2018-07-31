# frozen_string_literal: true

When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see the welcome message and Curso and Recursos$/) do
  expect(page).to have_content("BIENVENIDO AL PORTAL EDUCATIVO")
  expect(page).to have_content("CURSO")
  expect(page).to have_content("RECURSOS")
end

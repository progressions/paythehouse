Given /^a signed\-in user named "([^\"]*)"$/ do |login|
  Given "a user: \"#{login}\" exists with login: \"#{login}\", name: \"#{login}\", state: \"active\", email: \"#{login}@gmail.com\""
  When "I go to the login page"
  And "I fill in \"Username\" with \"#{login}\""
  And "I fill in \"Password\" with \"p@ssw0rd\""
  And "I press \"Login\""
  Then "I should be on the homepage"
  Then "I should see \"Welcome, #{login}\""
end

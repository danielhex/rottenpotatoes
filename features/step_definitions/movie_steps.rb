# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create(:title => movie[:title], :rating => movie[:rating], :release_date => movie[:release_date])
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
end

# When /^(?:|I )check "([^"]*)"$/ do |field|
#   check(field)
# end

# When /^(?:|I )uncheck "([^"]*)"$/ do |field|
#   uncheck(field)
# end
When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  #puts uncheck
  rating_list.split(',').each do |rating|
    #flunk uncheck
    if uncheck
      #When %{I fill in "#{name}" with "#{value}"}
      #When /^(?:|I )check "([^"]*)"$/ do |field|
      uncheck("ratings_#{rating}")
      #end
    else
      check("ratings_#{rating}")
    end
  end
end
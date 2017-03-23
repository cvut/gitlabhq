FactoryGirl.define do
  sequence(:username) { |n| "user#{n}" }
  sequence(:name) { |n| "John Doe#{n}" }
  sequence(:email) { |n| "user#{n}@example.org" }
  sequence(:email_alias) { |n| "user.alias#{n}@example.org" }
  sequence(:url) { |n| "http://example#{n}.org" }
  sequence(:label) { |n| "label#{n}" }
  sequence(:branch) { |n| "my-branch-#{n}" }
  sequence(:issue_created_at) { |n| 4.hours.ago + (2 * n).seconds }
end

FactoryGirl.define do
  factory :comment do
    id 1
    content "Nice Post"
    user_id 1
    post_id 1
  end
end

FactoryGirl.define do
  factory :item do
    user
    voting
    title "burritos"
    special false
    fixed false
    birthday_name "birthday name"
    cached_votes_score 10
  end
end

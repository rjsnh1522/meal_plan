FactoryGirl.define do
  factory :recipe do
    name "Mom's Spaghetti"
    description "the best pasta"
    association(:user)
  end
end

FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar123"
    password_confirmation "foobar123"

    factory :admin do
      admin true
    end
  end

  factory :post do
    sequence(:title)    { |n| "Post #{n}" }
    sequence(:content)  { |n| "Content #{n}" }
    user
  end

  factory :category do
    sequence(:name) { |n| "Category #{n}"}
  end
end
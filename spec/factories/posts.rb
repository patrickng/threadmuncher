FactoryGirl.define do |variable|
  factory :post do
    type_of_post "1"
    category_id 1
    title "Test post"
    url "http://google.com"
  end
end
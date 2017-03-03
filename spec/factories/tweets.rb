# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    text "awwwwww"
    image "http://i.huffpost.com/gen/3001432/original.jpg"
    
    # sequence(:text) { |i| }
  end
end

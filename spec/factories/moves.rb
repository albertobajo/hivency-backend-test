FactoryBot.define do
  factory :move do
    name { "MyString" }
    move { 1 }
    game { build(:game) }
  end
end

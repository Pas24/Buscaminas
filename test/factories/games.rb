FactoryBot.define do
  factory :game do
    name { "MyString" }
    rows { 1 }
    columns { 1 }
    mines { 1 }
    score { "MyString" }
    status { 1 }
  end
end

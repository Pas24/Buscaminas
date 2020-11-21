FactoryBot.define do
  factory :game_table do
    row { 1 }
    column { 1 }
    value { 1 }
    status { false }
    game { nil }
  end
end

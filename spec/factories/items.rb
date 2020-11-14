FactoryBot.define do
  factory :item do
    name         {"abc"}
    quantity        {10}
    category_id  {111}
    remarks      {nil}
    deadline     {nil}
    shop         {nil}
    user_id      {1}
  end
end
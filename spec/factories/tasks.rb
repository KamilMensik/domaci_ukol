FactoryBot.define do
  factory :task do
    user
    project
    file {"Neco.png"}
    title {"task"}
    is_done {false}
    description {"HELLO"}
  end
end

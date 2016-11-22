FactoryGirl.define do
  factory :workflow, class: Sipity::Workflow do
    # name 'generic_work'
    sequence(:name) { |n| "generic_work-#{n}" }
  end
end

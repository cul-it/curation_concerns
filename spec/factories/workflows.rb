FactoryGirl.define do
  factory :workflow, class: Sipity::Workflow do
    sequence(:name) { |n| "generic_work-#{n}" }
    # name 'generic_work'
  end
end

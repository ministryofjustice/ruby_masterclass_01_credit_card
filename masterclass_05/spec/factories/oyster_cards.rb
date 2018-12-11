# == Schema Information
#
# Table name: oyster_cards
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  balance    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do

  factory :oyster_card do
    user    { create :user }
    balance { rand(100..5000) }

    trait :zero_balance do
      balance { 0 }
    end
  end
end

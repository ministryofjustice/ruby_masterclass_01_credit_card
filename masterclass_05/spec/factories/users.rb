# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#

FactoryBot.define do

  factory :user do
    sequence(:name)        { |n| "User #{n}" }
    email                   { name.tr(' ', '_').downcase + '@moj.com' }

    factory :user_john_doe do
      name                { 'John Doe' }
    end
  end

end

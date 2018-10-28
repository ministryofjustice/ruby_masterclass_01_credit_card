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

require 'rails_helper'


describe User do

  context 'validations' do
    it 'errors if no name present' do
      user = User.new
      expect(user).not_to be_valid
      expect(user.errors[:name]).to eq ["can't be blank"]
    end

    it 'does not error if name present' do
      user = User.new(name: 'Stephen')
      expect(user).to be_valid
    end
  end
end

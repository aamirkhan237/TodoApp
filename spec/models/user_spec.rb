# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:tasks).dependent(:destroy) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:mobile_number) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:date_of_birth) }
  it { should allow_value('user@example.com').for(:email) }
  it { should_not allow_value('userexample.com').for(:email) }
  it { should allow_value('9876543210').for(:mobile_number) }
  it { should_not allow_value('12345').for(:mobile_number) }


  context 'when creating user' do
    let(:user) {build :user}
    let(:user1) { build :user, email: user.email}
    it 'email should be  with all attirbutes' do
      user.save
      expect(user1.save).to eq(false)
      expect{user1.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  
end

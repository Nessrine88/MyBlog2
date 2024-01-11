require 'rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(name: 'nessrine', photo: 'https://cat.png', bio: 'this is a developer profile', posts_counter: 0) }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'photo should be present ' do
    subject.photo = nil
    expect(subject).to_not be_valid
  end

  it 'bio should be present' do
    subject.bio = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end

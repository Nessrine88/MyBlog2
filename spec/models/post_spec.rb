require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(title: 'my first post', text: 'this the first description text of my first descrption post', likes_counter: 0,
             comments_counter: 0)
  end
  before { subject.save }

  it 'title should be present ' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater or equal to zero' do
    subject.likes_counter = -2
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater or equal to zero' do
    subject.comments_counter = -3
    expect(subject).to_not be_valid
  end

  it 'text length should be shorter than 250 character' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end
end

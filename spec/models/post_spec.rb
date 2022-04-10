require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'testing post slug' do
    let(:post) { FactoryBot.create(:post) }

    it "should add slug when create" do
      expect(post.slug).not_to be_nil
    end
    
    it "should change slug when title is changed" do
      old_slug = post.slug
      post.update(title: 'new title')
      expect(post.slug).not_to eq(old_slug)
    end
  end

  context 'relations' do
    it 'belongs to user' do
      should belong_to(:user)
    end

    it 'has many comments' do
      should have_many(:comments)
    end

    it 'has many notifications' do
      should have_many(:notifications)
    end
  end

  context 'validate presence of' do
    it 'body' do
      should validate_presence_of(:body)
    end

    it 'title' do
      should validate_presence_of(:title)
    end
  end
end

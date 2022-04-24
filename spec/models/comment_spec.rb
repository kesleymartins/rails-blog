require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'relations' do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
    it { should have_rich_text(:body) }
  end
end

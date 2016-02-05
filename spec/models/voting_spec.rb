require 'rails_helper'

describe Voting do
  let!(:voting) { FactoryGirl.create(:voting) }
  let!(:item) { FactoryGirl.create(:item, voting_id: voting.id) }

  describe ':vote' do
    it "should be an initial state" do
      expect(voting.open?).to eq(true)
    end
  end

  describe 'voting' do
    it "should move from :open to :voting when begin a voting" do
      voting.vote
      expect(voting.voting?).to eq(true)
    end
  end

  describe 'reviewing' do
    it "should move from :voting to :reviewing  when the votings close" do
      voting.vote
      voting.close
      expect(voting.reviewing?).to eq(true)
    end
  end

  describe 'published' do
    it "should move from :reviewing to :published when voting is publicated" do
      voting.vote
      voting.close
      voting.publish
      expect(voting.published?).to eq(true)
    end
  end

  describe 'reopen' do
    it "should move from :published to :open when voting is reopen" do
      voting.reopen
      expect(voting.open?).to eq(true)
    end
  end

  describe 'last_published' do
    it "return the votings with status is equal to published" do
      voting.update_attributes(status: 'published')
      expect(Voting.last_published.status).to eq("published")
    end
  end

  describe 'under_review' do
    it "return the votings with status is equal to reviewing" do
      voting.update_attributes(status: 'reviewing')
      expect(Voting.under_review.status).to eq("reviewing")
    end
  end

  describe 'current' do
    it "return the current voting" do
      expect(Voting.current.status).to eq("open")
    end
  end

  describe 'create_results' do
    it "create results for fixed or special item" do
      item.update_attributes(fixed: true)
      expect(voting.create_results.last).to eq(item)
    end
  end

  describe 'fixed_items' do
    it "return fixed or special item" do
      item.update_attributes(special: true)
      expect(voting.fixed_items.first).to eq(item)
    end
  end

  describe 'my_items' do
    it "select items from current_user" do
      current_user = item.user_id
      expect(voting.my_items(current_user).first).to eq(item)
    end
  end

  describe 'in_review_or_published?' do
    it "indicate if voting is in reviewing or published status" do
      expect(voting.in_review_or_published?).to eq(false)
    end
  end
end

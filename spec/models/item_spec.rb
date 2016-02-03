require 'rails_helper'

describe Item do
  let!(:voting) { FactoryGirl.create(:voting) }
  let!(:item) { FactoryGirl.create(:item, voting_id: voting.id ) }

  describe 'fixed' do
    it "return a item with field fixed is equal to true" do
      item.update_attributes(fixed: true)
      expect(Item.fixed(item.voting_id).count).to eq(1)
    end
  end
  describe 'special' do
    it "return a item with field special is equal to true" do
      item.update_attributes(special: true)
      expect(Item.special(item.voting_id).count).to eq(1)
    end
  end
  describe 'most_voted' do
    it "return most_voted item were fixed and special is equal to false" do
      expect(Item.most_voted(item.voting_id).count).to eq(1)
    end
  end
  describe 'for_results' do
    it "return results of fixed, special and most voted methods" do
      expect(Item.for_results(item.voting_id).count).to eq(1)
    end
  end
end

require 'rails_helper'

describe Result do
  let!(:item) { FactoryGirl.create(:item) }
  let!(:voting) { FactoryGirl.create(:voting) }
  let!(:result) { FactoryGirl.create(:result, item_id: item.id, voting_id: voting.id) }

  describe 'update_results_date' do
    it "update the attribute scheduled_on where find the result id" do
      days= { result.id =>"0", "14"=>"1", "15"=>"2", "16"=>"3", "17"=>"4"}
      expect(Result.update_results_date(days)).to be_nil
    end
  end
  describe 'find_date' do
    it "find the date of days hash" do
      index = [result.id, "0"]
      date = Date.parse("Monday")
      delta = date > Date.today ? 0 : 7
      expect(Result.find_date(index[1])).to eq(date + delta)
    end
  end
  describe 'by_voting' do
    it "return the results by voting and in ASC form" do
      expect(Result.by_voting(result.voting_id).count).to eq(1)
    end
  end
  describe 'day' do
    it "return the week day that match with numbers 0 to 4, if number is 0 return Monday" do
      expect(Result.day("0")).to eq("Monday")
    end
  end
end

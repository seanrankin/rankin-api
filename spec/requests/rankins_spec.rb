require 'spec_helper'

describe "Rankins API" do
  describe "GET /api/v1/rankins" do
    it "returns all the Rankins" do
      FactoryGirl.create(:rankin, :first_name => 'Joe', :last_name => 'Rankin')
      FactoryGirl.create(:rankin, :first_name => 'Bob', :last_name => 'Rankin')
      @api_key = FactoryGirl.create(:api_key)

      get "/api/v1/rankins", {}, { "Accept" => "application/json", "HTTP_AUTHORIZATION"=>"Token token=\"#{@api_key.access_token}\"" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      first_names = body.map { |m| m["first_name"] }
      last_names = body.map { |m| m["last_name"] }

      expect(first_names).to match_array(["Joe", "Bob"])
      expect(last_names).to match_array(["Rankin", "Rankin"])
    end
  end

  describe "GET /api/v1/rankins/:id" do
    it "returns a requested rankin" do
      m = FactoryGirl.create(:rankin, :first_name => 'Frank', :last_name => 'Rankin')
      @api_key = FactoryGirl.create(:api_key)

      get "/api/v1/rankins/#{m.id}", {}, { "Accept" => "application/json", "HTTP_AUTHORIZATION"=>"Token token=\"#{@api_key.access_token}\"" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body["first_name"]).to eq "Frank"
    end
  end
end

require 'spec_helper'

describe "Rankins API" do
  # Index
  describe "GET /api/v1/rankins" do
    it "returns all the Rankins" do
      FactoryGirl.create(:rankin, :first_name => 'Joe', :last_name => 'Rankin')
      FactoryGirl.create(:rankin, :first_name => 'Bob', :last_name => 'Rankin')
      @api_key = FactoryGirl.create(:api_key)

      get "/api/v1/rankins", {}, { "Accept" => "application/json", "HTTP_AUTHORIZATION"=>"Token token=\"#{@api_key.access_token}\"" }

      body = JSON.parse(response.body)
      first_names = body.map { |m| m["first_name"] }
      last_names = body.map { |m| m["last_name"] }
      expect(first_names).to match_array(["Joe", "Bob"])
      expect(last_names).to match_array(["Rankin", "Rankin"])
      expect(response.status).to eq 200
    end
  end

  # Show
  describe "GET /api/v1/rankins/:id" do
    it "returns a requested rankin" do
      @rankin = FactoryGirl.create(:rankin)
      @api_key = FactoryGirl.create(:api_key)

      get "/api/v1/rankins/#{@rankin.id}", {}, { "Accept" => "application/json", "HTTP_AUTHORIZATION"=>"Token token=\"#{@api_key.access_token}\"" }

      body = JSON.parse(response.body)
      expect(body["first_name"]).to eq "Fakey"
      expect(response.status).to eq 200
    end
  end

  # New
  describe "POST /api/v1/rankins" do
    it "creates a new rankin" do
      @api_key = FactoryGirl.create(:api_key)

      post "/api/v1/rankins/?rankin[first_name]=Liver&rankin[last_name]=Deaky", {}, { "Accept" => "application/json", "HTTP_AUTHORIZATION"=>"Token token=\"#{@api_key.access_token}\"" }

      body = JSON.parse(response.body)
      expect(body["first_name"]).to eq "Liver"
      expect(response.status).to eq 201
    end
  end

  # Destroy
  describe "DELETE /api/v1/rankins/:id" do
    it "deletes a specific rankin" do
      @rankin = FactoryGirl.create(:rankin)
      @api_key = FactoryGirl.create(:api_key)

      delete "/api/v1/rankins/#{@rankin.id}", {}, { "Accept" => "application/json", "HTTP_AUTHORIZATION"=>"Token token=\"#{@api_key.access_token}\"" }

      expect(response.status).to eq 204
    end
  end
end

require "spec_helper"

describe MeetupGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/meetup_groups").should route_to("meetup_groups#index")
    end

    it "routes to #new" do
      get("/meetup_groups/new").should route_to("meetup_groups#new")
    end

    it "routes to #show" do
      get("/meetup_groups/1").should route_to("meetup_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/meetup_groups/1/edit").should route_to("meetup_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/meetup_groups").should route_to("meetup_groups#create")
    end

    it "routes to #update" do
      put("/meetup_groups/1").should route_to("meetup_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/meetup_groups/1").should route_to("meetup_groups#destroy", :id => "1")
    end

  end
end

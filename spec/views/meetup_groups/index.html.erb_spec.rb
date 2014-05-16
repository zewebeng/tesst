require 'spec_helper'

describe "meetup_groups/index" do
  before(:each) do
    assign(:meetup_groups, [
      stub_model(MeetupGroup,
        :owner_id => 1,
        :topic => "Topic",
        :home_town => "Home Town"
      ),
      stub_model(MeetupGroup,
        :owner_id => 1,
        :topic => "Topic",
        :home_town => "Home Town"
      )
    ])
  end

  it "renders a list of meetup_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Topic".to_s, :count => 2
    assert_select "tr>td", :text => "Home Town".to_s, :count => 2
  end
end

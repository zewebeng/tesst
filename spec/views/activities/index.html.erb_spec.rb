require 'spec_helper'

describe "activities/index" do
  before(:each) do
    assign(:activities, [
      stub_model(Activity,
        :Name => "Name",
        :Location => "Location",
        :Duration => 1,
        :Description => "MyText",
        :meetup_group_id => 2,
        :Definite => false,
        :votes_count => 3
      ),
      stub_model(Activity,
        :Name => "Name",
        :Location => "Location",
        :Duration => 1,
        :Description => "MyText",
        :meetup_group_id => 2,
        :Definite => false,
        :votes_count => 3
      )
    ])
  end

  it "renders a list of activities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end

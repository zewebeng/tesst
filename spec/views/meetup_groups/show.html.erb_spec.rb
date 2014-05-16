require 'spec_helper'

describe "meetup_groups/show" do
  before(:each) do
    @meetup_group = assign(:meetup_group, stub_model(MeetupGroup,
      :owner_id => 1,
      :topic => "Topic",
      :home_town => "Home Town"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Topic/)
    rendered.should match(/Home Town/)
  end
end

require 'spec_helper'

describe "meetup_groups/edit" do
  before(:each) do
    @meetup_group = assign(:meetup_group, stub_model(MeetupGroup,
      :owner_id => 1,
      :topic => "MyString",
      :home_town => "MyString"
    ))
  end

  it "renders the edit meetup_group form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", meetup_group_path(@meetup_group), "post" do
      assert_select "input#meetup_group_owner_id[name=?]", "meetup_group[owner_id]"
      assert_select "input#meetup_group_topic[name=?]", "meetup_group[topic]"
      assert_select "input#meetup_group_home_town[name=?]", "meetup_group[home_town]"
    end
  end
end

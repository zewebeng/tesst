require 'spec_helper'

describe "activities/edit" do
  before(:each) do
    @activity = assign(:activity, stub_model(Activity,
      :Name => "MyString",
      :Location => "MyString",
      :Duration => 1,
      :Description => "MyText",
      :meetup_group_id => 1,
      :Definite => false,
      :votes_count => 1
    ))
  end

  it "renders the edit activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do
      assert_select "input#activity_Name[name=?]", "activity[Name]"
      assert_select "input#activity_Location[name=?]", "activity[Location]"
      assert_select "input#activity_Duration[name=?]", "activity[Duration]"
      assert_select "textarea#activity_Description[name=?]", "activity[Description]"
      assert_select "input#activity_meetup_group_id[name=?]", "activity[meetup_group_id]"
      assert_select "input#activity_Definite[name=?]", "activity[Definite]"
      assert_select "input#activity_votes_count[name=?]", "activity[votes_count]"
    end
  end
end

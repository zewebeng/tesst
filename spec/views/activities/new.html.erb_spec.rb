require 'spec_helper'

describe "activities/new" do
  before(:each) do
    assign(:activity, stub_model(Activity,
      :Name => "MyString",
      :Location => "MyString",
      :Duration => 1,
      :Description => "MyText",
      :meetup_group_id => 1,
      :Definite => false,
      :votes_count => 1
    ).as_new_record)
  end

  it "renders new activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", activities_path, "post" do
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

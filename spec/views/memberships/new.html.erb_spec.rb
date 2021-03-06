require 'spec_helper'

describe "memberships/new" do
  before(:each) do
    assign(:membership, stub_model(Membership,
      :meetup_group_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new membership form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", memberships_path, "post" do
      assert_select "input#membership_meetup_group_id[name=?]", "membership[meetup_group_id]"
      assert_select "input#membership_user_id[name=?]", "membership[user_id]"
    end
  end
end

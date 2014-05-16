require 'spec_helper'

describe "activities/show" do
  before(:each) do
    @activity = assign(:activity, stub_model(Activity,
      :Name => "Name",
      :Location => "Location",
      :Duration => 1,
      :Description => "MyText",
      :meetup_group_id => 2,
      :Definite => false,
      :votes_count => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Location/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
    rendered.should match(/false/)
    rendered.should match(/3/)
  end
end

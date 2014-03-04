require 'spec_helper'

describe "boards/show" do
  before(:each) do
    @board = assign(:board, stub_model(Board,
      :title => "MyText",
      :subtitle => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end

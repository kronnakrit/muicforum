require 'spec_helper'

describe "boards/edit" do
  before(:each) do
    @board = assign(:board, stub_model(Board,
      :title => "MyText",
      :subtitle => "MyText"
    ))
  end

  it "renders the edit board form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", board_path(@board), "post" do
      assert_select "textarea#board_title[name=?]", "board[title]"
      assert_select "textarea#board_subtitle[name=?]", "board[subtitle]"
    end
  end
end

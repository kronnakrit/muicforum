require 'spec_helper'

describe "boards/new" do
  before(:each) do
    assign(:board, stub_model(Board,
      :title => "MyText",
      :subtitle => "MyText"
    ).as_new_record)
  end

  it "renders new board form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", boards_path, "post" do
      assert_select "textarea#board_title[name=?]", "board[title]"
      assert_select "textarea#board_subtitle[name=?]", "board[subtitle]"
    end
  end
end

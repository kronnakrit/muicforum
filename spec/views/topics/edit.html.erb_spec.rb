require 'spec_helper'

describe "topics/edit" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :title => "MyText",
      :subtitle => "MyText",
      :user => nil,
      :board => nil
    ))
  end

  it "renders the edit topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", topic_path(@topic), "post" do
      assert_select "textarea#topic_title[name=?]", "topic[title]"
      assert_select "textarea#topic_subtitle[name=?]", "topic[subtitle]"
      assert_select "input#topic_user[name=?]", "topic[user]"
      assert_select "input#topic_board[name=?]", "topic[board]"
    end
  end
end

class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def tagcloud
  	@tags = Topic.tag_counts_on(:keyword, :limit => 100, :order => "count desc")
  end

  def about
  end

  def contact
  end
end

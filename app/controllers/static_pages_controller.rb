class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def tagcloud
  	@tags = Topic.tag_counts_on(:keyword, :limit => 45, :order => "count desc")
  end
end

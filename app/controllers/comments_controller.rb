class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end
  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @topic = Topic.find(params[:topic_id])
  	@comment = Comment.new(comment_params)
  	@comment.topic_id = @topic.id
  	@comment.user_id = current_user.id

      if @comment.save
      	@topic.update_attributes(:updated_at => @comment.updated_at)
      	flash[:success] = "Comment was successfuly created."
        redirect_to board_topic_path(@topic.board.id, @topic.id)
      else
        flash[:warning] = 'Comment is empty.'
  		redirect_to board_topic_path(@topic.board.id, @topic.id)
      end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
  	@topic = Topic.find(params[:topic_id])
      if @comment.update(comment_params)
      	flash[:success] = "Comment was successfuly created."
      	redirect_to board_topic_path(@topic.board.id, @topic.id)
      else
      	redirect_to board_topic_path(@topic.board.id, @topic.id)
      end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
  	@topic = Topic.find(params[:topic_id])
  	@comment.topic = @topic
  	@comment.update_attributes(dstatus: true)
  	# @comment.toggle!(:delete)
    #@comment.destroy
    respond_to do |format|
      flash[:success] = "Comment was successfuly deleted."
      format.html { redirect_to board_topic_path(@topic.board.id, @topic.id) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :topic_id)
    end

 
end

class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
  end

  def boardpanel
  	@boards = Board.all
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  	@board = Board.find(params[:id])
  	@topics = @board.topics.paginate(per_page: 20, page:params[:page])
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)

      if @board.save
        flash[:success] = "Board was successfully created"
        redirect_to boardpanel_path
      else
        render 'new' 
      end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
      if @board.update(board_params)
        flash[:success] = "Board was successfully updated."
        redirect_to boardpanel_path
      else
        render 'edit'
      end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
  	@board.topics.each do |topic|
    		topic.keyword_list.remove(topic.keyword_list, parse: true)
    		topic.save
    end
    @boards = Board.all
    if @board.destroy
 		flash[:success] = "Board was successfully deleted"
 		respond_to do |format|
      		format.html { redirect_to boardpanel_path }
     		format.js
    	end 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:title, :subtitle)
    end
end

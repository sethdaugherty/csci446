class GamesController < ApplicationController
  filter_access_to :all
  before_filter :require_user, :except => :index
  before_filter :find_game, :only => [:show, :edit, :update, :destroy]

  helper_method :get_count, :get_percent_rated

  # GET /games
  # GET /games.xml
  def index
    @games = Game.paginate :page => params[:page], :order => 'title', :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/new
  # GET /games/new.xml
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new(params[:game])
    respond_to do |format|
      if @game.save
        flash[:notice] = 'Game was successfully created.'
        format.html { redirect_to(@game) }
        format.xml  { render :xml => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update

    respond_to do |format|
      if @game.update_attributes(params[:game])
        flash[:notice] = 'Game was successfully updated.'
        format.html { redirect_to(@game) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game.destroy

    respond_to do |format|
      format.html { redirect_to(games_url) }
      format.xml  { head :ok }
    end
  end

  # Return the number of games owned by the
  # specified user
  def get_count( user_id )
    return Game.count(:conditions => ["user_id = ?", user_id])
  end

  # Return the number of games owned by the
  # specified user that are rated
  def get_rated_count( user_id )
    return Game.count(:conditions => ["user_id = ? AND rating != '' AND rating IS NOT NULL", user_id])
  end

  # Return the percent of games owned by the
  # specified user where the rating is not null
  def get_percent_rated( user_id )
    return 100.0 * get_rated_count(user_id) / get_count( user_id )  
  end

  private 
    def find_game
        @game = Game.find(params[:id])
    end
end

class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update, :destroy]

  # GET /spaces
  # GET /spaces.json
  def index
    # @spaces = Space.all.each.find_all { |space| space.users.member?(current_user)}
    redirect_to user_path(current_user)
  end

  # GET /spaces/1
  # GET /spaces/1.json
  def show
    @space = Space.find(params[:id])
  end

  # GET /spaces/new
  def new
    @space = Space.new
  end

  # GET /spaces/1/edit
  def edit
    @space = Space.find(params[:id])
  end

  # POST /spaces
  # POST /spaces.json
  def create
    @space = Space.new(space_params)

    if !@space.save
      redirect_to new_space_path
    else 
      current_user.spaces << @space
      redirect_to space_media_path(@space)
    end

    # respond_to do |format|
    #   if @space.save
    #     format.html { redirect_to @space, notice: 'Space was successfully created.' }
    #     format.json { render :show, status: :created, location: @space }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @space.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /spaces/1
  # PATCH/PUT /spaces/1.json
  def update

    @space = Space.find(params[:id])
    @space.update_attributes(space_params)
    
    if @space.save 
      redirect_to space_media_path(@space)
    else
      redirect_to edit_space(@space)
    end

    # respond_to do |format|
    #   if @space.update(space_params)
    #     format.html { redirect_to @space, notice: 'Space was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @space }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @space.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /spaces/1
  # DELETE /spaces/1.json
  def destroy
    @space.destroy
    respond_to do |format|
      format.html { redirect_to spaces_url, notice: 'Space was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def add_user
    @space = Space.find(params[:id])
    @user = User.find(params[:user_id])
    if(@space != nil && @user != nil)
      @space.users << @user
      redirect_to space_path(@space)
    else
      redirect_to space_path(@space)
    end
  end

  def remove_user
    @space = Space.find(params[:id])
    @user = User.find(params[:user_id])

    if (@space != nil && @user != nil)
     @space.users.delete(@user) 
     @user.spaces.delete(@space)
    end

    if @user == current_user
      redirect_to user_path(@space)
    else
      redirect_to space_path(@space)
    end 

  end


  def remove_medium
    @space = Space.find(params[:id])
    @medium = @space.media.find(params[:medium_id])

    if (@space != nil && @medium != nil)
     @space.media.delete(@medium) 
    end

    redirect_to space_media_path(@space)
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space
      @space = Space.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_params
      params.require(:space).permit(:name)
    end
end

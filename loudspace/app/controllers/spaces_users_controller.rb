class SpacesUsersController < ApplicationController
  before_action :set_spaces_user, only: [:show, :edit, :update, :destroy]

  # GET /spaces_users
  # GET /spaces_users.json
  def index
    @spaces_users = SpacesUser.all
  end

  # GET /spaces_users/1
  # GET /spaces_users/1.json
  def show
  end

  # GET /spaces_users/new
  def new
    @spaces_user = SpacesUser.new
  end

  # GET /spaces_users/1/edit
  def edit
  end

  # POST /spaces_users
  # POST /spaces_users.json
  def create
    @spaces_user = SpacesUser.new(spaces_user_params)

    respond_to do |format|
      if @spaces_user.save
        format.html { redirect_to @spaces_user, notice: 'Spaces user was successfully created.' }
        format.json { render :show, status: :created, location: @spaces_user }
      else
        format.html { render :new }
        format.json { render json: @spaces_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spaces_users/1
  # PATCH/PUT /spaces_users/1.json
  def update
    respond_to do |format|
      if @spaces_user.update(spaces_user_params)
        format.html { redirect_to @spaces_user, notice: 'Spaces user was successfully updated.' }
        format.json { render :show, status: :ok, location: @spaces_user }
      else
        format.html { render :edit }
        format.json { render json: @spaces_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spaces_users/1
  # DELETE /spaces_users/1.json
  def destroy
    @spaces_user.destroy
    respond_to do |format|
      format.html { redirect_to spaces_users_url, notice: 'Spaces user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spaces_user
      @spaces_user = SpacesUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spaces_user_params
      params[:spaces_user]
    end
end

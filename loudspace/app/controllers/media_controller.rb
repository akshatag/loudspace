class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :edit, :update, :destroy]

  # GET spaces/1/media
  # GET spaces/1/media.json
  def index
    @space = Space.find(params[:space_id])
    @media = @space.media
  end

  # GET spaces/media/1
  # GET spaces/media/1.json
  def show
    @space = Space.find(params[:space_id])
    @medium = Medium.find(params[:id])
  end

  # GET spaces/1/media/new
  def new
    @space = Space.find(params[:space_id])
    @medium = Medium.new
  end

  # GET space/1/media/1/edit
  def edit
    @space = Space.find(params[:space_id])
    @medium = Medium.find(params[:id])
  end

  # POST spaces/1/media
  # POST spaces/1/media.json
  def create
    @space = Space.find(params[:space_id])
    @medium = @space.media.create(medium_params)
    
    if @medium.save
      redirect_to space_media_path(@space)
    else
      redirect_to new_space_medium_path(@space)
    end

    # @medium = Medium.new(medium_params)

    # respond_to do |format|
    #   if @medium.save
    #     format.html { redirect_to @medium, notice: 'Medium was successfully created.' }
    #     format.json { render :show, status: :created, location: @medium }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @medium.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT spaces/1/media/1
  # PATCH/PUT spaces/1/media/1.json
  def update
    @medium = Medium.find(params[:id])
    @medium.update_attributes(medium_params)

    redirect_to space_medium_path(@space, @medium)
    return
    # respond_to do |format|
    #   if @medium.update(medium_params)
    #     format.html { redirect_to @medium, notice: 'Medium was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @medium }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @medium.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE spaces/1/media/1
  # DELETE spaces/1/media/1.json
  def destroy
    @medium.destroy
    respond_to do |format|
      format.html { redirect_to media_url, notice: 'Medium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medium
      @medium = Medium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medium_params
      params.require(:medium).permit(:url);
    end

end

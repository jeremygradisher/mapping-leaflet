class MapimagesController < ApplicationController
  before_action :set_mapimage, only: [:show, :edit, :update, :destroy]

  # GET /mapimages
  # GET /mapimages.json
  def index
    @mapimages = Mapimage.all
  end

  # GET /mapimages/1
  # GET /mapimages/1.json
  def show
  end

  # GET /mapimages/new
  def new
    @mapimage = Mapimage.new
  end

  # GET /mapimages/1/edit
  def edit
  end

  # POST /mapimages
  # POST /mapimages.json
  def create
    @mapimage = Mapimage.new(mapimage_params)

    respond_to do |format|
      if @mapimage.save
        format.html { redirect_to @mapimage, notice: 'Mapimage was successfully created.' }
        format.json { render :show, status: :created, location: @mapimage }
      else
        format.html { render :new }
        format.json { render json: @mapimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mapimages/1
  # PATCH/PUT /mapimages/1.json
  def update
    respond_to do |format|
      if @mapimage.update(mapimage_params)
        format.html { redirect_to @mapimage, notice: 'Mapimage was successfully updated.' }
        format.json { render :show, status: :ok, location: @mapimage }
      else
        format.html { render :edit }
        format.json { render json: @mapimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mapimages/1
  # DELETE /mapimages/1.json
  def destroy
    @mapimage.destroy
    respond_to do |format|
      format.html { redirect_to mapimages_url, notice: 'Mapimage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mapimage
      @mapimage = Mapimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mapimage_params
      params.require(:mapimage).permit(:map_id, :mapimage, :width, :height, :map_id)
    end
end

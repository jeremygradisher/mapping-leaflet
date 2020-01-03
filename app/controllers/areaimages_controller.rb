class AreaimagesController < ApplicationController
  before_action :set_areaimage, only: [:show, :edit, :update, :destroy]

  # GET /areaimages
  # GET /areaimages.json
  def index
    @areaimages = Areaimage.all
  end

  # GET /areaimages/1
  # GET /areaimages/1.json
  def show
  end

  # GET /areaimages/new
  def new
    @areaimage = Areaimage.new
  end

  # GET /areaimages/1/edit
  def edit
  end

  # POST /areaimages
  # POST /areaimages.json
  def create
    @areaimage = Areaimage.new(areaimage_params)

    respond_to do |format|
      if @areaimage.save
        format.html { redirect_to @areaimage, notice: 'Areaimage was successfully created.' }
        format.json { render :show, status: :created, location: @areaimage }
      else
        format.html { render :new }
        format.json { render json: @areaimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /areaimages/1
  # PATCH/PUT /areaimages/1.json
  def update
    respond_to do |format|
      if @areaimage.update(areaimage_params)
        format.html { redirect_to @areaimage, notice: 'Areaimage was successfully updated.' }
        format.json { render :show, status: :ok, location: @areaimage }
      else
        format.html { render :edit }
        format.json { render json: @areaimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areaimages/1
  # DELETE /areaimages/1.json
  def destroy
    @areaimage.destroy
    respond_to do |format|
      format.html { redirect_to areaimages_url, notice: 'Areaimage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_areaimage
      @areaimage = Areaimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def areaimage_params
      params.require(:areaimage).permit(:area_id, :areaimage)
    end
end

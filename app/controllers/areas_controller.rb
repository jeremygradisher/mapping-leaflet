class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]

  # GET /areas
  # GET /areas.json
  def index
    @areas = Area.all
  end

  # GET /areas/1
  # GET /areas/1.json
  def show
    @map = Map.find(@area.map_id)
    @mapimage = @map.mapimages.first
    @areaimages = @area.areaimages.all
  end

  # GET /areas/new
  def new
    @area = Area.new
    @map = Map.find(params[:map_id])
    @map_id = params[:map_id]
    @mapimage = @map.mapimages.first
    @mapimages = @map.mapimages.all
    @areas = @map.areas.all
    @areaimage = @area.areaimages.build
    @areaimages = @area.areaimages.all
  end

  # GET /areas/1/edit
  def edit
    @map = Map.find(@area.map_id)
    @mapimage = @map.mapimages.first
    @mapimages = @map.mapimages.all
    @areas = @map.areas.all
    @areaimage = @area.areaimages.build
    @areaimages = @area.areaimages.all
  end

  # POST /areas
  # POST /areas.json
  def create
    @area = Area.new(area_params)

    respond_to do |format|
      if @area.save
        if params.has_key?(:areaimages)
           params[:areaimages]['areaimage'].each do |a|
              @areaimage = @area.areaimages.create!(:areaimage => a)
           end
        end
        format.html { redirect_to @area, notice: 'Area was successfully created.' }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /areas/1
  # PATCH/PUT /areas/1.json
  def update
    respond_to do |format|
      if @area.update(area_params)
        if params.has_key?(:areaimages)
           params[:areaimages]['areaimage'].each do |a|
              @areaimage = @area.areaimages.create!(:areaimage => a)
           end
        end
        format.html { redirect_to @area, notice: 'Area was successfully updated.' }
        format.json { render :show, status: :ok, location: @area }
      else
        format.html { render :edit }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areas/1
  # DELETE /areas/1.json
  def destroy
    @area.destroy
    respond_to do |format|
      format.html { redirect_to areas_url, notice: 'Area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_params
      params.require(:area).permit(:name, :info, :status, :coords, :map_id, :square_feet, :key, areaimages_attributes: [:id, :area_id, :areaimage])
    end
end

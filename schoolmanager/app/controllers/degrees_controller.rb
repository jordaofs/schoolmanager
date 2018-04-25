class DegreesController < ApplicationController
  before_action :find_degree, only: [:edit, :update, :destroy, :show]

  def index
    @degrees = Degree.all
  end

  def show
    
  end

  def new
    @degree = Degree.new
  end

  def edit

  end

  def create
    @degree = Degree.new(degree_params)

    if @degree.save
      redirect_to degrees_path, notice: 'degree created'
    else
      puts @degree.errors.full_messages
      render :new
    end
  end

  def update
    if @degree.update_attributes(degree_params)
      redirect_to degree_path(@degree), notice: "#{@degree.name} was updated!"
    else
      render :edit
    end
  end

  def destroy
    @degree.destroy
    respond_to do |format|
      format.html { redirect_to degrees_url, notice: 'Degree was successfully destroyed.' }
    end
  end

  private

    def degree_params
      params.require(:degree).permit(:name)
    end

    def find_degree
      @degree = Degree.find(params[:id])
    end
    
end
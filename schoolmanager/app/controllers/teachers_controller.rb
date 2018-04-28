class TeachersController < ApplicationController
  before_action :find_teacher, only: [:edit, :update, :destroy, :show]

  def index
    @teachers = Teacher.all
  end

  def show
    
  end

  def new
    @teacher = Teacher.new
  end

  def edit

  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to teachers_path, notice: 'teacher created'
    else
      puts @teacher.errors.full_messages
      render :new
    end
  end

  def update
    if @teacher.update_attributes(teacher_params)
      redirect_to teacher_path(@teacher), notice: "#{@teacher.name} was updated!"
    else
      render :edit
    end
  end

  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
    end
  end

  private

    def teacher_params
      params.require(:teacher).permit(:name, :email, :cpf, :age)
    end

    def find_teacher
      @teacher = Teacher.find(params[:id])
    end
    
end
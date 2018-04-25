class StudentsController < ApplicationController
  before_action :find_student, only: [:edit, :update, :destroy, :show]

  def index
    @students = Student.all
  end

  def show
    
  end

  def new
    @student = Student.new
  end

  def edit

  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to students_path, notice: 'Student created'
    else
      puts @student.errors.full_messages
      render :new
    end
  end

  def update
    if @student.update_attributes(student_params)
      redirect_to student_path(@student), notice: "#{@student.name} was updated!"
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
    end
  end

  private

    def student_params
      params.require(:student).permit(:name, :email, :cpf, :age)
    end

    def find_student
      @student = Student.find(params[:id])
    end
    
end
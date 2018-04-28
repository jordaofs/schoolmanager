class DegreesController < ApplicationController
  before_action :find_degree, only: [:edit, :update, :destroy, :show]

  def index
    @degrees = Degree.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Your_filename",
        template: "degrees/index.html.erb"
        # layout: 'pdf.html'
      end
     end
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
      subject1 = Subject.find_by name: (params[:degree][:subjects])
      puts subject1.name
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

  def add_subjects
    teacher_select
    subject_select
    @degree = Degree.find(params[:degree_id])
    subject_id = params[:subjects]
    degree_id = params[:degrees]

    puts "HELLO + "
  end

  def copy
    degree = Degree.find(params[:degree_id])
    id1 = params[:degree_id]
    subject_name = params[id1][:subjects]
    subject = Subject.find_by name: subject_name
    teacher_name = 
    teacher = Teacher.find_by name: params[id1][:teachers]
    if subject != nil && teacher != nil
      respond_to do |format|
        puts subject
        puts teacher
        subject.degree_id = id1
        teacher.degree_id = id1
        degree.subjects << subject
        degree.teachers << teacher
        # subject.teachers << teacher
        # subject.teachers.degree_id << degree.id
        format.html { redirect_to degrees_path, notice: 'Subject and Teacher add' }
      end
    else
      respond_to do |format|
        flash.now[:alert] = 'Subject or Teacher does not exist!'
        format.html { render :add_subjects }
      end
    end
  end

  private

    def degree_params
      params.require(:degree).permit(:name, :student_id, :degree,
         subjects_attributes: [:id, :name],
         teachers_attributes: [:name])
    end

    def find_degree
      @degree = Degree.find(params[:id])
    end

    def teacher_select
      @teachers = Teacher.all
    end

    def subject_select
      @subjects = Subject.all
    end
    
end
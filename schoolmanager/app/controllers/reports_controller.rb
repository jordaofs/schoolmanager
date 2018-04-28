class ReportsController < ApplicationController
  def index
    
  end

  def show

  end

  def students
    @students = Student.order("degree_id")
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "students",
        template: "reports/index.html.erb"
        # layout: 'pdf.html'
      end
     end
  end
  
  def teachers
    @degrees = Degree.all
    @teachers = []
    @subjects = []
    @degrees.each do |degree|
      @teachers = @teachers + degree.teachers
      @subjects = @subjects + degree.subjects
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "teachers",
        template: "reports/teachers.html.erb"
        # layout: 'pdf.html'
      end
    end
  end

  def degrees
    degree = params[:degree][:name]
    @degree = Degree.find_by name: degree
    @teachers = @degree.teachers
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Your_filename",
        template: "reports/degrees.html.erb"
        # layout: 'pdf.html'
      end
    end
  end

  # def teachers
  #   teacher = params[:teacher][:name]
  #   @degrees = Degree.all
  #   @teacher = Teacher.find_by name: teacher
  #   @teacher_array = Array.new
  #   @degrees.each do |degree|
  #     degree.teachers do |teacher2|
  #       if teacher2 == teacher
  #         @teacher_array << teacher2
  #       end
  #     end
  #   end
  #   respond_to do |format|
  #     format.html
  #     format.pdf do
  #       render pdf: "Your_filename",
  #       template: "reports/teachers.html.erb"
  #       # layout: 'pdf.html'
  #     end
  #   end
  # end

end
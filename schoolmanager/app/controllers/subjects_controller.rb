class SubjectsController < ApplicationController
  before_action :find_subject, only: [:edit, :update, :destroy, :show]

  def index
    @subjects = Subject.all
  end

  def show
    
  end

  def new
    @subject = Subject.new
    teacher_select
  end

  def edit

  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to subjects_path, notice: 'subject created'
    else
      puts @subject.errors.full_messages
      render :new
    end
  end

  def update
    if @subject.update_attributes(subject_params)
      redirect_to subject_path(@subject), notice: "#{@subject.name} was updated!"
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
    end
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :teacher_id)
    end

    def find_subject
      @subject = Subject.find(params[:id])
    end

    def teacher_select
      @teachers_options_for_select = Teacher.all
    end
    
end
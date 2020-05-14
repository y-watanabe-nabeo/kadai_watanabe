class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      redirect_to @course
    else
      render 'show'
    end
  end

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def destroy
    @course = Course.find(params[:id])
    @course_id = @course.course_id
    @course.destroy
    flash[:success] = "Course deleted!"
  end

  def confirm_delete
    @course = Course.find(params[:id])
  end

  private

    def course_params
      params.require(:course).permit(:course_id, :course_title,
                      :topic, :price, :level_id, :category)
    end
end

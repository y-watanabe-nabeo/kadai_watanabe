class TopPagesController < ApplicationController
  def top
  end

  def search_keyword
    if search_params[:keyword].empty?
      redirect_to root_path
    else
      @courses = Course.where("CONCAT(course_title, topic, category) LIKE ?", "%#{ search_params[:keyword] }%")
      render "courses/index.html.erb"
    end
  end

  def search_category
    if search_params[:category].empty?
      redirect_to root_path
    else
      @courses = Course.where("category LIKE ?", "%#{ search_params[:category] }%")
      render "courses/index.html.erb"
    end
  end

  private

    def search_params
      params.permit(:keyword, :category)
    end
end

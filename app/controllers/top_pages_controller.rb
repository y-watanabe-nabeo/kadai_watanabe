class TopPagesController < ApplicationController

  def top
    Rails.cache.delete('courses')
  end

  def search_keyword
    if search_params[:keyword].blank? && !Rails.cache.exist?('courses')
      redirect_to root_path
    else
      @courses = Rails.cache.fetch("courses") { Course.where("CONCAT(course_title, topic, category) LIKE ?", "%#{ search_params[:keyword] }%") }
      render "courses/index"
    end
  end

  def search_category
    if search_params[:category].blank? && !Rails.cache.exist?('courses')
      redirect_to root_path
    else
      @courses = Rails.cache.fetch("courses") { Course.where("category LIKE ?", "%#{ search_params[:category] }%") }
      render "courses/index"
    end
  end

  private

    def search_params
      params.permit(:keyword, :category)
    end
end

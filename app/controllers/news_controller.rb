class NewsController < ApplicationController
  def home
    @articles = Article.all(:order => "created_at DESC, id DESC")
  end

  def article
    @article = Article.find_by_permalink(params[:id])
  end

end

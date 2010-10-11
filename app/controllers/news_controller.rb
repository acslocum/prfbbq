class NewsController < ApplicationController
  def home
    @articles = Article.all(:conditions=> ["is_published=?",true], :order => "created_at DESC, id DESC")
  end

  def article
    @article = Article.find_by_permalink(params[:id])
  end

end

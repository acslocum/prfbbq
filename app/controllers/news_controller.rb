class NewsController < ApplicationController
  def news_article
  end
  def home
    @articles = Article.all
  end

end

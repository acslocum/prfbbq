require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "permalink converts title and date" do
    expected="chicago-10-11-2010"
    article = Article.new(:title=>"Chicago", :event_date=>"2010-10-11")
    assert_equal expected, article.permalink
  end

  test "title_to_link converts spaces to hyphens" do
    article = Article.new(:title=>"a title with spaces")
    assert_equal "a-title-with-spaces", article.title_to_link
  end
  
  test "can find an article based on its link" do
    article = Article.new(:title=>"Chicago BBQ", :event_date=>"2010-10-12")
    article.save
    found = Article.find_by_permalink(article.permalink)
    assert_equal article,found
  end
  
  test "can extract a title from a permalink" do
    title = Article.extract_title("chicago-bbq-10-10-2010")
    assert_equal "chicago bbq", title
  end
  
  test "can extract a date from a permalink" do
    date = Article.extract_date("chicago-bbq-10-21-2010")
    expected = Date.civil(2010,10,21)
    assert_equal expected, date
  end
  
end

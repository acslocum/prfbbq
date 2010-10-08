class BetterArticleData < ActiveRecord::Migration
  def self.up
    Article.delete_all
    Article.create(:title=>"Chicago BBQ announced!", :content=>"10-10-2010! At Quenchers!!!!")
    Article.create(:title=>"Some BBQ announced!", :content=>%{Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus non tellus vel dui lobortis tempor ut ut massa. Proin et tellus nisl. Donec non metus ac augue egestas malesuada non vitae sapien. Duis et augue eget erat porttitor tincidunt nec vitae felis. Cras ut mi sed eros volutpat placerat. <a href="#">Praesent sed arcu id</a> neque viverra mollis. Fusce adipiscing est at ipsum vulputate non faucibus magna interdum. Maecenas tortor magna, rutrum vel pulvinar at, mollis in lacus.})
    Article.create(:title=>"Thing BBQ announced!", :content=>%{Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus non tellus vel dui lobortis tempor ut ut massa. Proin et tellus nisl. Donec non metus ac augue egestas malesuada non vitae sapien. Duis et augue eget erat porttitor tincidunt nec vitae felis. Cras ut mi sed eros volutpat placerat. <a href="#">Praesent sed arcu id</a> neque viverra mollis. Fusce adipiscing est at ipsum vulputate non faucibus magna interdum. Maecenas tortor magna, rutrum vel pulvinar at, mollis in lacus.})
    Article.create(:title=>"Whatever BBQ announced!", :content=>%{Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus non tellus vel dui lobortis tempor ut ut massa. Proin et tellus nisl. Donec non metus ac augue egestas malesuada non vitae sapien. Duis et augue eget erat porttitor tincidunt nec vitae felis. Cras ut mi sed eros volutpat placerat. <a href="#">Praesent sed arcu id</a> neque viverra mollis. Fusce adipiscing est at ipsum vulputate non faucibus magna interdum. Maecenas tortor magna, rutrum vel pulvinar at, mollis in lacus.})
  end

  def self.down
    Article.delete_all
  end
end

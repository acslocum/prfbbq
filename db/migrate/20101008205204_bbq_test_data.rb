class BbqTestData < ActiveRecord::Migration
  def self.up
    Bbq.delete_all
    Bbq.create(:title=>'Chicago BBQ', :event_date=>"2010-10-10", :content => 
    %{<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus non tellus vel dui lobortis tempor ut ut massa. Proin et tellus nisl. Donec non metus ac augue egestas malesuada non vitae sapien. Duis et augue eget erat porttitor tincidunt nec vitae felis. Cras ut mi sed eros volutpat placerat. <a href="#">Praesent sed arcu id</a> neque viverra mollis. Fusce adipiscing est at ipsum vulputate non faucibus magna interdum. Maecenas tortor magna, rutrum vel pulvinar at, mollis in lacus.</p>
        <p>In hac habitasse platea dictumst. In in massa in quam hendrerit gravida sed a purus. Donec placerat tristique laoreet. Proin hendrerit magna et lectus dictum vitae ornare nunc lacinia. Nulla facilisi. Aliquam dui neque, dictum sit amet cursus quis, condimentum eu leo. Pellentesque tempus velit ut mauris condimentum vitae gravida enim accumsan. Quisque ultrices nisi ac tortor malesuada accumsan. In hac habitasse platea dictumst.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus non tellus vel dui lobortis tempor ut ut massa. Proin et tellus nisl. Donec non metus ac augue egestas malesuada non vitae sapien. Duis et augue eget erat porttitor tincidunt nec vitae felis. Cras ut mi sed eros volutpat placerat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus non tellus vel dui lobortis tempor ut ut massa. Proin et tellus nisl. Donec non metus ac augue egestas malesuada non vitae sapien.</p>}
    )
  end

  def self.down
    Bbq.delete_all
  end
end

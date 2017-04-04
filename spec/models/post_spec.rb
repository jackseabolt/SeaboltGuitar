require 'rails_helper'

RSpec.describe Post, type: :model do

	before do 
		@post = Post.create( title:"test", body: "testing" )
	end	
   
  it "should validate body field" do 
  	expect(@post).to be_valid
  	expect(Post.create( title:"test" )).not_to be_valid
  end 

  it "should validate title field" do 
  	expect(@post).to be_valid
  	expect(Post.create( body: "testing" )).not_to be_valid
  end

end

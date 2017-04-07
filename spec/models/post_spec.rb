require 'rails_helper'

RSpec.describe Post, type: :model do

	let!(:test_post) { Post.new( title:"test", body: "testing" ) }
	
   
  it "should validate body field" do 
  	expect(test_post).to be_valid
  	expect(Post.new( title:"test")).not_to be_valid
  end 

  it "should validate title field" do 
  	expect(test_post).to be_valid
  	expect(Post.new( body: "testing" )).not_to be_valid
  end

end

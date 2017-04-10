class Post < ApplicationRecord

	validates :body, presence: true
	validates :title, presence: true
	validates :video, presence: true

end

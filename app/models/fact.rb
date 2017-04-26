class Fact < ApplicationRecord
	has_many :favorites
	has_many :users, through: :favorites

	def self.retrieve(num = 30)
		url = "http://catfacts-api.appspot.com/api/facts?number=#{num}"
		response = HTTParty.get(url)
		parsed_response = JSON.parse(response)
		facts = parsed_response["facts"]
		return facts
	end

	def save_as_favorite_for(user)
		Favorite.find_or_create_by(fact_id: self.id, user_id: user.id)
	end
end

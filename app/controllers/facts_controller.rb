class FactsController < ApplicationController
	before_action :authenticate_user!

  def index
  	@facts = Fact.retrieve(76)
  end

  def create
  	# Steps
  	# Save the fact to our table
  	content = params[:content]
  	fact = Fact.find_or_create_by(content: content)

  	# Create a favorite with that fact id and user id
  	fact.save_as_favorite_for(current_user)

  	# TODO: Redirect to a page that has favorites#index
  	redirect_to root_path
  end
end

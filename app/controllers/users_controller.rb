class UsersController < ApplicationController
	before_action :authenticate_user!

  def show
  	@favorite_facts = current_user.facts
  end
end

class PagesController < ApplicationController
  def index
  	if current_user
  		redirect_to chats_path
  	end
  end
end

class PagesController < ApplicationController
  def home
  end
  
  def about
  end
  
  def search
    user = User.where("lower(name) = ?", params[:input_stuff]).first
    
    @search_results = if user
                        Pin.where("description LIKE ? OR user_id = ?", "%#{params[:input_stuff]}%", user.id)
                      else
                        Pin.where("description LIKE ?", "%#{params[:input_stuff]}%")
                      end
  end
  
  
end

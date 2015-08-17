class PagesController < ApplicationController
  def home
  end
  
  def about
  end
  
  def search
    user = User.where("lower(name) LIKE ?", "%#{params[:input_stuff].downcase}%").first
    
    @search_results = if user
                        Pin.where("description LIKE ? OR user_id = ?", "%#{params[:input_stuff].downcase}%", user.id)
                      else
                        Pin.where("lower(description) LIKE ?", "%#{params[:input_stuff].downcase}%")
                      end
  end
  
  
end

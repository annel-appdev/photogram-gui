class UsersController < ApplicationController
# layout("wrapper.html.erb")

  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})
    render({ :template => "user_templates/index.html.erb" })
  end

  def user_details
    #Parameters: {"username"=>"anisa"}
    
    url_username = params.fetch("username")
    matching_username = User.where({:username => url_username })
    @the_user = matching_username.at(0)
    
    #if the_user == nil
      #redirect_to("/404")
    #else
      render({ :template => "user_templates/user_details.html.erb" })
    #end
  end

end

class UsersController < ApplicationController
# layout("wrapper.html.erb")

  def homepage
    redirect_to("/users")
  end

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

  def add_username
    #Parameters: {"query_username"=>"anne"}

    input_username = params.fetch("query_username")
    new_user = User.new
    new_user.username = input_username
    new_user.save
    
    redirect_to("/users/" + new_user.username.to_s)
   #render({ :template => "user_templates/add_user.html.erb" })
  end

  def update_username
    #Parameters: {"query_username"=>"anne", "modify_username"=>"chi"}

    a_username = params.fetch("modify_username")
    matching_username = User.where({:username => a_username})
    the_username = matching_username.at(0)
  
    input_username = params.fetch("query_username")
    the_username.username = input_username
    
    the_username.save

    redirect_to("/users/" + the_username.username.to_s) 

    #render({ :template => "user_templates/add_user.html.erb" })
  end
end

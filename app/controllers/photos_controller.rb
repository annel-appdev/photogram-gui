class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc })
    render({ :template => "photo_templates/index.html.erb"})
  end

  def photo_details
    #Parameters: {"photo_id"=>"842"}
    url_id = params.fetch("photo_id")
    matching_photo = Photo.where({ :id => url_id})
    @the_photo = matching_photo.at(0)
  render({ :template => "photo_templates/photo_details.html.erb"})
  end

  def delete_photo
    #Parameters: {"photo_id"=>"919;"}
    the_id = params.fetch("photo_id")
    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.at(0)
    the_photo.destroy
    #render({ :template => "photo_templates/delete_photo.html.erb"})
    redirect_to("/photos")
  end

  def add_photo
    #Parameters: {"query_image"=>"https://media.thetot.com/wp-content/uploads/2019/03/18133538/LITTLELIGHTSROBOTLAMPNAVYBLUERED.jpg", "query_caption"=>"Hello world!", "query_owner_id"=>"117"}

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    new_photo = Photo.new
    new_photo.image = input_image
    new_photo.caption = input_caption
    new_photo.owner_id = input_owner_id

  new_photo.save

    #render({ :template => "photo_templates/add_photo.html.erb"})
    redirect_to("/photos/" + new_photo.id.to_s)
  end

  def photo_update
    #Parameters: {"query_image"=>"https://media.thetot.com/wp-content/uploads/2019/03/18133538/LITTLELIGHTSROBOTLAMPNAVYBLUERED.jpg", "query_caption"=>"954", "modify_id"=>"954"}

    the_id = params.fetch("modify_id")
    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.at(0)
    
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    #input_owner_id = params.fetch("query_owner_id", "false")

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    #render({ :template => "photo_templates/photo_update.html.erb"})
    #redirect_to("/photos/" + the_photo.id.to_s) OR CAN BE WRITTEN AS:

    next_url = "/photos/" + the_photo.id.to_s
    redirect_to(next_url)
  end

end

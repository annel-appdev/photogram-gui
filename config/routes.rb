Rails.application.routes.draw do

get("/users", { :controller => "users", :action => "index" })

get("/users/:username", { :controller => "users", :action => "user_details" })

get("/photos", { :controller => "photos", :action => "index" })

get("/photos/:photo_id", { :controller => "photos", :action => "photo_details" })

get("/delete_photo/:photo_id", { :controller => "photos", :action => "delete_photo"})

get("/insert_photo", { :controller => "photos", :action => "add_photo"})
end

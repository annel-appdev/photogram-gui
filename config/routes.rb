Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "homepage" })

  get("/users", { :controller => "users", :action => "index" })

get("/users/:username", { :controller => "users", :action => "user_details" })

get("/photos", { :controller => "photos", :action => "index" })

get("/photos/:photo_id", { :controller => "photos", :action => "photo_details" })

get("/delete_photo/:photo_id", { :controller => "photos", :action => "delete_photo"})

get("/insert_photo", { :controller => "photos", :action => "add_photo"})

get("/update_photo/:modify_id", { :controller => "photos", :action => "photo_update"})

get("/add_user", { :controller => "users", :action => "add_username"})

get("/update_user/:modify_username", { :controller => "users", :action => "update_username"})

get("/insert_comment", { :controller => "comments", :action => "add_comment"})

end

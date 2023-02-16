class CommentsController < ApplicationController

  def add_comment
    #Parameters: {"query_photo_id"=>"695", "query_author_id"=>"117", "query_body"=>"hi\r\n"}

    input_id = params.fetch("query_photo_id")
    input_author_id = params.fetch("query_author_id", "false") 
    input_comment = params.fetch("query_body")

    new_comment = Comment.new
    new_comment.photo_id = input_id
    new_comment.author_id = input_author_id
    new_comment.body = input_comment

    new_comment.save

    redirect_to("/photos/" + new_comment.photo_id.to_s)
    #render({ :template => "photo_templates/comment.html.erb"})
  end

end

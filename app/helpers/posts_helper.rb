module PostsHelper
  def display_comments(post, comments)
    if comments.present? 
      comments.map { |comment| "<p> <strong>#{comment.user.name}: </strong> #{comment.text}</p>" }
    else 
      ["<p>No comments for this post</p>"]
    end 
  end
end

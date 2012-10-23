module PostsHelper
  def display_url_link(post)
    if post.type_of_post == 1
      if post.url.starts_with?("http://")
        return link_to post.title, post.url, target: "_blank"
      else
        return link_to post.title, "http://" + post.url, target: "_blank"
      end
    elsif post.type_of_post == 2
      return link_to post.title, post
    end
  end  
end

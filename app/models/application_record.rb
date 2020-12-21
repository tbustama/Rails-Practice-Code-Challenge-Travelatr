class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def featured_post
    self.posts.max_by{|post| post.likes} if self.posts
  end
end

class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def average_age
        bloggers = self.bloggers.uniq
        bloggers.sum{|blogger| blogger.age} / bloggers.count
    end

    def five_recent
        self.posts.last(5)
    end
end

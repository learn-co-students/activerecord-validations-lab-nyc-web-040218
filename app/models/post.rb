class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
 validates :title, inclusion: { in: ["Won't Believe", "Secret", "Top", "Guess"]}
# message: "%{value} is not a valid category!" )}
  Post.validate
end

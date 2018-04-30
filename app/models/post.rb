# class MyValidator < ActiveModel::Validator
#   def validate(post)
#     clicky_text = ["Won't Believe", "Secret", "Top [number]", "Guess"]
#     clicky_text.each do |ct|
#       unless post.title.include?(ct)
#         record.errors[:title] << 'Need a clickbait-y title please!'
#       end
#     end
#   end
# end

class Post < ActiveRecord::Base
  # include ActiveModel::Validations
  # validates_with MyValidator
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validate :clickyBait?
end

def clickyBait?
  clicky_text = ["Won't Believe", "Secret", "Top [number]", "Guess"]
  clicky_text.each do |ct|
    unless self.title.include?(ct)
      'Need a clickbait-y title please!'
    end
  end
end
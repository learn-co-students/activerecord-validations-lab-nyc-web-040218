class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a valid category" }
  validate :clickyBait?
end

@@clicky_text = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

def clickyBait?
  if @@clicky_text.none? { |ct| ct.match title }
    errors.add(:title, "Need a clickbait-y title please!")
  end
end

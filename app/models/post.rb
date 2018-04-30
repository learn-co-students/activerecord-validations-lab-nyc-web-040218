class Post < ActiveRecord::Base
    validates_with MyValidator
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction), message: false}
    validate :title
end

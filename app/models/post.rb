class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.title && (record.title.include?("Won't Believe") || record.title.include?("Secret") || record.title.include?("Top") || record.title.include?("Guess"))
      record.errors[:title] << "shitty headline"
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates_with MyValidator
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
end



# All posts have a title
# Post content is at least 250 characters long
# Post summary is a maximum of 250 characters
# Post category is either Fiction or Non-Fiction This step requires an inclusion validator, which was not outlined in the README lesson. You'll need to refer to the Rails guide to look up how to use it.

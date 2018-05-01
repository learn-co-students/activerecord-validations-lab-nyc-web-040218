

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates(:content, {:length => {:minimum => 250}})
  validates(:summary, {:length => {:maximum => 250}})
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :validate_title

  private
  def validate_title
    booleans = []
    clickbait_words = ["Won't Believe", "Secret", "Top", "Guess"]
    clickbait_words.each do |word|
      if self.title == nil
        false
      else
        booleans << self.title.include?(word)
      end
    end
    #binding.pry if self.title == "True Facts"
    if booleans.include?(true)
      true
    else
      self.errors[:title] << 'Not clickbaity enough!'
    end
  end
end

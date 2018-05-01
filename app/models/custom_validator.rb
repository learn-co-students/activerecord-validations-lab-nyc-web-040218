class MyValidator < ActiveModel::Validator
  array = ["Won't Believe", "Secret", "Top", "Guess"]
   def validate(post)
     if :title == nil
     end
       unless !post.title.blank? && array.any? {|word| post.title.include?(word)}
         post.errors[:name] << false
       end
     end
end

#BRIE'S CODE!!

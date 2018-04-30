class MyValidator < ActiveModel::Validator
    def validate(record)
        str = ["Won't Believe", "Secret", "Top", "Guess"]
        unless !record.title.blank? && str.any? {|word| record.title.include?(word)}
          record.errors[:name] << false
        end
      end
end
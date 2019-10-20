class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction) }
    validate :is_title_clickbait  

    WORDS_FOR_CLICKBAIT = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
      ]

    def is_title_clickbait
        if WORDS_FOR_CLICKBAIT.none? do |pat|
            pat.match title
        end 
        errors.add(:title, "Title must be clickbait")
        end 
    end 
end

# Finally, add a custom validator to Post that ensures the title is sufficiently clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", the validator should add a validation.
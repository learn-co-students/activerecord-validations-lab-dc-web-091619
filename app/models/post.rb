class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250}

    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category"}
    
    validate :clickbait?

    def clickbait?
        clickbait = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]

        if clickbait.none? {|phrase| phrase.match(title)}
        errors.add(:title, "Title is not clickbaitable")
        end
    end

    # Finally, add a custom validator to Post that ensures the title is sufficiently clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", the validator should add a validation.

end

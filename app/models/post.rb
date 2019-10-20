class Post < ActiveRecord::Base
    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction) }
    validate :is_title_clickbait  

    def is_title_clickbait
        clickbait = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
        if clickbait.none? do |pat|
            pat.match title
        end 
        errors.add(:title, "Title must be clickbait")
        end 
    end 
end


class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 50 }
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait

  @@clickbait_patterns = [
    /Won't Believe/i,
    /Secret/i, 
    /Top \d+/i, 
    /Guess/i
  ]

  def is_clickbait
    if @@clickbait_patterns.none? {|pattern| pattern.match(title)}
      errors.add(:title, "Title isn't clickbaity")
    end
  end
    

  # def is_clickbait
  #   if title.split(" ").any?(/(Won't Believe)|(Secret)|(Top \d+)|(Guess)/)
  #     errors.add(:title, "Title isn't clickbaity")
  #   end
  # end

end



# Won't Believe", "Secret", "Top [number]", or "Guess"
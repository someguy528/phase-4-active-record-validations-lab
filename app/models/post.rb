class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_is_clickbait

    def title_is_clickbait
        unless title =~ /Won't Believe/i || title =~ /Secret/i ||title =~ /Top [number]/i || title =~ /Guess/i
            errors.add(:title, "Must be clickbait!")
        end
    end
end

# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true, uniqueness: true
    validate :short_url
    validates :user_id, presence: true

    def self.random_code
        temp = SecureRandom.urlsafe_base64
        raise "url already exists" if ShortenedUrl.exists?(short_url: temp)
        temp
    end

    def self.new_url(user, long_url)
        new_short_url = ShortenedUrl.new(long_url: long_url, user_id: user.id, short_url: ShortenedUrl.random_code)
        new_short_url.save!
    end

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

end

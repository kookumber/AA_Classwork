class Visit < ApplicationRecord
    validates :user_id, :url_id, existence: true

    def self.record_visit!(user, shortened_url)
        Visit.create!()
    end
end

# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    
    validates :birth_date, :name, presence: true
    cat_colors = ['rainbow', 'magenta', 'sapphire', 'blue', 'azure', 'seafoam green', 'red', 'opal', 'yellow']
    validates :color, presence: true, inclusion: cat_colors
    validates :sex, inclusion: ["M", "F"]
    
    require 'action_view'
    require 'date'


    # ActionView::Helpers::DateHelper

    def age 
        now = Time.zone.now.to_date

        now.year - (self.birth_date).year - ((now.month > (self.birth_date).month || (now.month == (self.birth_date).month && now.day >= (self.birth_date).day)) ? 0 : 1)
        # age = (Date.today - Date.parse(birth_date)) / 365
        # age.to_i
    end

    has_many :rental_requests,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :CatRentalRequest

end

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


end

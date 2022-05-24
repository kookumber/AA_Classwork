# == Schema Information
#
# Table name: polls
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#

require_relative 'question.rb'
require_relative 'answer_choice.rb'
require_relative 'response.rb'
require_relative 'user.rb'

class Poll < ApplicationRecord

    validates :title, presence: true, uniqueness: true
    validates :author_id, presence: true

    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User
        
    has_many :questions,
        primary_key: :id,
        foreign_key: :poll_id,
        class_name: :Poll

end

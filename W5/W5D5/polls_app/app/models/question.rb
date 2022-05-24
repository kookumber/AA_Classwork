# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  questions  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poll_id    :integer          not null
#

require_relative 'poll.rb'
require_relative 'answer_choice.rb'
require_relative 'response.rb'
require_relative 'user.rb'

class Question < ApplicationRecord

    validates :text, presence: true, uniqueness: true
    validates :poll_id, presence: true

    belongs_to :poll,
        primary_key: :id,
        foreign_key: :poll_id,
        class_name: :Poll
    
    has_many :answer_choices,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :AnswerChoice

    has_many :responses,
        through: :answer_choices,
        source: :responses

    
end

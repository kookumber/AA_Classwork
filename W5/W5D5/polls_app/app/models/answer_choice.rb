# == Schema Information
#
# Table name: answer_choices
#
#  id            :bigint           not null, primary key
#  answer_choice :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  question_id   :integer          not null
#

require_relative 'poll.rb'
require_relative 'question.rb'
require_relative 'response.rb'
require_relative 'user.rb'

class AnswerChoice < ApplicationRecord

    validates :text, presence: true, uniqueness: true
    validates :question_id, presence: true

    belongs_to :question,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: :Question
    
    has_many :responses,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: :Response

end

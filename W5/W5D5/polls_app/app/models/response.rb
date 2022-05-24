# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require_relative 'poll.rb'
require_relative 'question.rb'
require_relative 'answer_choice.rb'
require_relative 'user.rb'

class Response < ApplicationRecord

    validates :respondent, :answer_choice_id, presence: true

    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :respondent_id,
        class_name: :User

    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: :AnswerChoice

    has_one :question,
        through: :answer_choice,
        source: :question
    

    def sibling_responses
        self.question.responses.where.not(id: self.id).pluck
    end

    def respondent_already_answered?
        !self.sibling_responses.empty?
    end
end

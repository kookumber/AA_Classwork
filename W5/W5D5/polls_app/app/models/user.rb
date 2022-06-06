# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require_relative 'poll.rb'
require_relative 'question.rb'
require_relative 'answer_choice.rb'
require_relative 'response.rb'


class User < ApplicationRecord

    validates :username, presence: true, uniqueness: true

    has_many :authored_polls,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Poll

    has_many :responses,
        primary_key: :id,
        foreign_key: :respondent_id,
        class_name: :Response
end
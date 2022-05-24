class ChangeColumnsForQuestionsAndAnswerChoices < ActiveRecord::Migration[6.1]
  def change
    change_column :answer_choices, :answer_choice, :string
    rename_column :answer_choices, :answer_choice, :text
    

    change_column :questions, :questions, :string
    rename_column :questions, :questions, :text
    
    rename_column :responses, :user_id, :respondent_id

    add_index :questions, :poll_id
    add_index :polls, :author_id
    add_index :answer_choices, :question_id

  end
end

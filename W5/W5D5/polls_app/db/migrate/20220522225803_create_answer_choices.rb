class CreateAnswerChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :answer_choices do |t|
      t.text :answer_choice, null: false
      t.timestamps
    end
  end
end

# == Schema Information
#
# Table name: cat_rental_requests
#
#  id          :bigint           not null, primary key
#  cat_id      :integer          not null
#  start_start :date             not null
#  end_date    :date             not null
#  status      :string           default("PENDING"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CatRentalRequest < ApplicationRecord

    rental_status = ["PENDING", "APPROVED", "DENIED"]
    validates :status, inclusion: rental_status
    
    belongs_to :cat,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :Cat

        
end

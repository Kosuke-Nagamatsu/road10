class Building < ApplicationRecord
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, reject_if: :all_blank
end

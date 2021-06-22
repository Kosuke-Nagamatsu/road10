class Building < ApplicationRecord
  has_many :stations
  accepts_nested_attributes_for :stations, reject_if: :all_blank
end

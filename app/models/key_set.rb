class KeySet < ApplicationRecord
  belongs_to :vocation

  has_many :key_assignments, inverse_of: :key_set
  accepts_nested_attributes_for :key_assignments, reject_if: :all_blank, allow_destroy: true
end

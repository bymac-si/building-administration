class Building < ApplicationRecord
  has_many :apartments

  def to_s
    name
  end
end

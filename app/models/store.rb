class Store < ApplicationRecord
  has_many :transactions,
           dependent: :restrict_with_error

  validates :name,
            presence: true

  validates :owner,
            presence: true

  def balance
    transactions.where(store_id: id).sum(:value)
  end
end

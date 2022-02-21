class Transaction < ApplicationRecord
  belongs_to :store

  enum kind: { none: 0, debit: 1, boleto: 2, financing: 3, credit: 4, loan: 5, bill: 6, ted: 7, doc: 8, rent: 9 },
       _prefix: true

  validates :kind,
            presence: true
end

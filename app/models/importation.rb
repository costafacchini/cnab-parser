class Importation < ApplicationRecord
  validates :content,
            presence: true
end

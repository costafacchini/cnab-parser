class ImportationJob < ApplicationJob
  queue_as :default

  def perform(importation_id)
    importation = Importation.find(importation_id)
    ImportCnab.call(importation.content)
  end
end

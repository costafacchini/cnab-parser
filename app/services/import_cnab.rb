class ImportCnab < ApplicationService
  def initialize(content)
    @content = content
  end

  def call
    @content.each_line do |line|
      next if line.strip.blank?

      cnab = Cnab.new(line)

      store = Store.find_or_create_by!(owner: cnab.store_owner, name: cnab.store_name)

      Transaction.create!(
        kind: cnab.kind, emitted_at: cnab.emitted_at, value: cnab.value, cpf: cnab.cpf, card: cnab.card, store: store
      )
    end
  end
end

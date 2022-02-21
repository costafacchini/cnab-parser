class ImportCnab400 < ApplicationService
  def initialize(content)
    @content = content
  end

  def call
    @content.each_line do |line|
      next if line.strip.blank?

      cnab400 = Cnab400.new(line)

      store = Store.find_or_create_by!(owner: cnab400.store_owner, name: cnab400.store_name)

      Transaction.create!(
        kind: cnab400.kind, emitted_at: cnab400.emitted_at, value: cnab400.value, cpf: cnab400.cpf, card: cnab400.card,
        store: store
      )
    end
  end
end

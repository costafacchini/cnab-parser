class Cnab
  def initialize(line)
    @line = line
  end

  def kind
    @line[0].to_i
  end

  def emitted_at
    Time.parse("#{@line[1..4]}-#{@line[5..6]}-#{@line[7..8]} #{@line[42..43]}:#{@line[44..45]}:#{@line[46..47]}")
        .in_time_zone('America/Sao_Paulo')
  end

  def value
    amount = "#{@line[9..16]}.#{@line[17..18]}".to_f
    [:boleto, :financing, :rent].include?(Transaction.kinds.key(kind).to_sym) ? amount * -1 : amount
  end

  def cpf
    @line[19..29]
  end

  def card
    @line[30..41]
  end

  def store_owner
    @line[48..61].strip
  end

  def store_name
    @line[62..80].strip
  end
end

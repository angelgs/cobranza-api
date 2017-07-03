module PersonHelper
  def clientes
    people.select { |person| ! person.user_id.nil? }
  end

  def referencias
    people.select { |person| person.user_id.nil? }
  end
end

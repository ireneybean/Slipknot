module ActsAsCurrency
  def acts_as_currency(*fields)
   fields.each{|field|
    field_equals = (field.to_s + '=').to_sym
    field_cents = field.to_s + '_cents'
    define_method(field) { send(field_cents).to_f/100 if send(field_cents) }
    define_method(field_equals) { |amount| send(field_cents + '=', amount.to_f * 100) }
    }
  end
end

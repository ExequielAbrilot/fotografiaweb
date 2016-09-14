json.array!(@compromissos) do |compromisso|
  json.extract! compromisso, :id, :titulo, :texto, :date ,:servicio_id,user_id,fotografo_id
  json.url compromisso_url(compromisso, format: :json)
end

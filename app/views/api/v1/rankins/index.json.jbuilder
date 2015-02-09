json.array!(@rankins) do |rankin|
  json.extract! rankin, :id, :first_name, :last_name, :birthday
  # json.url rankin_url(rankin, format: :json)
end

# This wraps the array in a root node called "data" for use in the datatable
# json.data do |json|
#   json.array!(@rankins) do |rankin|
#     json.extract! rankin, :id, :batch_id, :gift_type, :non_deductible, :name_or_giving_number, :check_number, :rankin_order
#
#     # Nested records
#     json.gifts rankin.gifts do |gift|
#       json.fund gift.fund
#       json.amount gift.amount
#       json.memo gift.memo
#     end
#   end
# end

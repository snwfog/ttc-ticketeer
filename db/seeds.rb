require 'require_all'

require_rel '../app'

# TicketType seed
ticket_types = TicketType.all
unless ticket_types.count == 2
  TicketType.create(
    price: 11.05,
    name: 'Group Pass',
    resource_key: 'group_pass',
    warning: 'Group Passes provide 2 adults and 4 youths (13-19) with unlimited travel for one day. Valid from the date shown on the pass until 5:30 a.m. next day. Available for use on Sat., Sun., statutory holidays or dates specified by the TTC.',
    type_uuid: 'ba8cf1fc-8607-49aa-9de2-b4b28559675e'
  )

  TicketType.create(
    price: 11.05,
    name: 'Single Day Pass',
    resource_key: 'single_day_pass',
    warning: 'Single Day Passes are available for use any day of the week, including statutory holidays. Passes are valid from the date shown on the pass until 5:30 a.m. the next day. Good for one person.',
    type_uuid: '23ffca5b-1af8-4741-ab75-81de0a4135c6'
  )
end

group = TicketType.find_by_type_uuid('ba8cf1fc-8607-49aa-9de2-b4b28559675e')
single = TicketType.find_by_type_uuid('23ffca5b-1af8-4741-ab75-81de0a4135c6')

# Ticket seed
Ticket.create(
        ticket_type: single,
)

# t.decimal :price
# t.string :name
# t.string :resource_key
# t.string :warning
# t.string :type_uuid
# t.integer :type_identifier
# GROUP_TICKET_TYPE: {
#   id:       1,
#   price:    11.50,
#   name:     'Group Pass',
#   resource: 'group_pass',
#   warning:  'Group Passes provide 2 adults and 4 youths (13-19) with unlimited travel for one day. Valid from the date shown on the pass until 5:30 a.m. next day. Available for use on Sat., Sun., statutory holidays or dates specified by the TTC.',
#   type:     TicketType.GROUP,
# },
#
#   SINGLE_TICKET_TYPE: {
#   id:       2,
#   price:    11.50,
#   // TODO: Refactor this string here
# name:     'Single Day Pass',
#   resource: 'single_day_pass',
#   warning:  'Single Day Passes are available for use any day of the week, including statutory holidays. Passes are valid from the date shown on the pass until 5:30 a.m. the next day. Good for one person.',
#   type:     TicketType.SINGLE,
# },

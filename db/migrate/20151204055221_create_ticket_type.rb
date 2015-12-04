class CreateTicketType < ActiveRecord::Migration
  def change
    create_table :ticket_types do |t|
      # price:    DS.attr('number'),
      #   name:     DS.attr(),
      #   resource: DS.attr(),
      #   warning:  DS.attr(),
      #   type:     DS.attr('number'),

      t.decimal :price
      t.string :name
      t.string :resource_key
      t.string :warning
      t.string :type_uuid
      t.integer :type_identifier
    end
  end
end

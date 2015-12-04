class CreateTicket < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      # ticketType: DS.belongsTo('ticket-type', { embedded: 'always' }),
      #   user:       DS.belongsTo('user', { async: true }),
      #
      #   uuid:        DS.attr(), // Server should generate this
      # createdAt:   DS.attr('number'),
      #   activatedAt: DS.attr('number'),
      t.references :ticket_type
      # t.references :user

      t.string :uuid
      t.datetime :activated_at
      t.timestamps null: false
    end
  end
end

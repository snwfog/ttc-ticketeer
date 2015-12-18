class AddUniqueConstraintToTicketType < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE ticket_types
      ADD CONSTRAINT ticket_types_type_uuid UNIQUE (type_uuid);
    SQL
  end

  # DELETE t FROM (
  #   SELECT ticket_types.id FROM ticket_types
  #   GROUP BY type_uuid
  #   HAVING COUNT(*) > 1
  # ) t2 JOIN ticket_types t on t.id = t2.id;

  def down
    execute <<-SQL
      ALTER TABLE ticket_types
      DROP INDEX ticket_types_type_uuid;
    SQL
  end
end

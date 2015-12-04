class TestMigration < ActiveRecord::Migration
  def up
    execute 'create table test (message varchar(100))'
  end

  def down
    execute 'drop table test'
  end
end

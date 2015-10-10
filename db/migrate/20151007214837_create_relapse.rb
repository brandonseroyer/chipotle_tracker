class CreateRelapse < ActiveRecord::Migration
  def change
    create_table(:relapses) do |t|
      t.column(:addict_id, :integer)
      t.column(:date, :datetime)
      t.column(:item, :string)

      t.timestamps()
    end
  end
end

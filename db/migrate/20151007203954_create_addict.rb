class CreateAddict < ActiveRecord::Migration
  def change
    create_table(:addicts) do |t|
      t.column(:name, :string)

      t.timestamps()
    end
  end
end

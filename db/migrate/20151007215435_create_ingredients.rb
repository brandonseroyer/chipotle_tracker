class CreateIngredients < ActiveRecord::Migration
  def change
    create_table(:ingredients) do |t|
      t.column(:name, :string)
      t.column(:fat, :integer)
      t.column(:calories, :integer)

      t.timestamps()
    end
  end
end

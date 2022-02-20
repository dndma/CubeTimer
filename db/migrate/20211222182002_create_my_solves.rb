class CreateMySolves < ActiveRecord::Migration[6.1]
  def change
    create_table :my_solves do |t|
      t.float :time
      t.string :scramble

      t.timestamps
    end
  end
end

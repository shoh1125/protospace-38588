class CreatePrototypeUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :prototype_users do |t|
      


      t.timestamps
    end
  end
end

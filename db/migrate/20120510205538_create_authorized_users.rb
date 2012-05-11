class CreateAuthorizedUsers < ActiveRecord::Migration
  def change
    create_table :authorized_users do |t|
      t.string :email
      t.references :patient

      t.timestamps
    end
    add_index :authorized_users, :patient_id
  end
end

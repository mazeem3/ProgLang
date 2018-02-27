class FixTableUsers < ActiveRecord::Migration[5.1]
  def change

    change_table :users do |t|
      t.rename :pasword_digest, :password_digest
    end
  end
end

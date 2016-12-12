class CreateUsersCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :users_companies do |t|
      t.references :user, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end

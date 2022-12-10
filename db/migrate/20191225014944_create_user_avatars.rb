class CreateUserAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :user_avatars do |t|
      t.integer :user_id_avatars
      t.string :avatar
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end

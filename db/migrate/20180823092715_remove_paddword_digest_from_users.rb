class RemovePaddwordDigestFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :paddword_digest, :string
  end
end

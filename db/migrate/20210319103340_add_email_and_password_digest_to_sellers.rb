class AddEmailAndPasswordDigestToSellers < ActiveRecord::Migration[6.1]
  def change
    add_column :sellers, :email, :string
    add_column :sellers, :password_digest, :string
  end
end

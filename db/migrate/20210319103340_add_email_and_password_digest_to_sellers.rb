class AddEmailAndPasswordDigestToSellers < ActiveRecord::Migration[6.1]
  def change
    add_column :seller, :email, :string
    add_column :seller, :password_digest, :string
  end
end

class AddKeyToCertificates < ActiveRecord::Migration[5.1]
  def change
    add_column :certificates, :keys, :string
    add_column :certificates, :cert_pem, :string
  end
end

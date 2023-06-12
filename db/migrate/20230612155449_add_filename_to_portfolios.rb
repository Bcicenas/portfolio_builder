class AddFilenameToPortfolios < ActiveRecord::Migration[7.0]
  def change
    add_column :portfolios, :filename, :string
  end
end

class RemoveFilenameFromPortfolios < ActiveRecord::Migration[7.0]
  def change
    remove_column :portfolios, :filename, :string
  end
end

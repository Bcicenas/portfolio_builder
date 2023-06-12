class RemoveFiledataFromPortfolios < ActiveRecord::Migration[7.0]
  def change
    remove_column :portfolios, :filedata, :blob
  end
end

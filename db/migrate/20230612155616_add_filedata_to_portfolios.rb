class AddFiledataToPortfolios < ActiveRecord::Migration[7.0]
  def change
    add_column :portfolios, :filedata, :blob
  end
end

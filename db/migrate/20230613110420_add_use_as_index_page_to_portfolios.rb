class AddUseAsIndexPageToPortfolios < ActiveRecord::Migration[7.0]
  def change
    add_column :portfolios, :use_as_index_page, :boolean
  end
end

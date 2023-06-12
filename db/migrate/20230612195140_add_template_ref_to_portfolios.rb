class AddTemplateRefToPortfolios < ActiveRecord::Migration[7.0]
  def change
    add_reference :portfolios, :template, null: true, foreign_key: true
  end
end

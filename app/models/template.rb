class Template < ApplicationRecord
  has_many :portfolios
  has_many_attached :template_files
end

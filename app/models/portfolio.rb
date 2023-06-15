class Portfolio < ApplicationRecord
  belongs_to :template

  def css_files
    files = template.template_files.reject { |file| file.filename.to_s.exclude?('.css') }
    files.map { |file| "<link rel=\"stylesheet\" href=\"#{file.url}\">" }.join(' ').html_safe
  end

  def js_files
    files = template.template_files.reject { |file| file.filename.to_s.exclude?('.js') }
    files.map { |file| "<script src=\"#{file.url}\"></script>" }.join(' ').html_safe
  end
end

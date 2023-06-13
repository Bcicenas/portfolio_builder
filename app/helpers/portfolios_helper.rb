module PortfoliosHelper
  def template_list
    Template.all.collect { |template| [ template.name, template.id ] }    
  end  

  def portfolio_list
    Portfolio.all.collect { |template| [ template.name, template.id ] }    
  end

  def portfolio_index(portfolio)
    index_page = portfolio.template.template_files.select { |file| file.filename == 'index.html' }.first
    index_page.present? ? index_page.download : 'index.html was not found'
  end
end

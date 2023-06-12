module PortfoliosHelper
	def template_list
    Template.all.collect { |template| [ template.name, template.id ] }    
  end
end

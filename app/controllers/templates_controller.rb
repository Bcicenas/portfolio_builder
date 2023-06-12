class TemplatesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_template, only: [:edit, :update, :destroy]

  def list
    @templates = Template.all
  end

  def new
    @template = Template.new
  end

  def create
    @template = Template.new(template_params)
    if @template.save
      flash[:notice] = 'Template was successfully created'
      redirect_to(templates_path) && (return false)
    else
      flash[:alert] = 'Template was not created'
      render(:new) && (return false)
    end
  end

  def edit
  end

  def update
    @template.assign_attributes(template_params)
    if @template.save
      flash[:notice] = 'Template was successfully updated'
      redirect_to(templates_path) && (return false)
    else
      flash[:alert] = 'Template was not updated'
      render(:edit) && (return false) 
    end   
  end

  def destroy
    if @template.destroy
      flash[:notice] = 'Template was successfully deleted'
    else
      flash[:alert] = 'Template was not deleted'
    end
    redirect_to(templates_path) && (return false)    
  end

  private

  def find_template
    @template = Template.where(id: params[:id]).first
    return if @template
    flash[:alert] = 'Template was not deleted'
    render(:edit) && (return false)     
  end

  def template_params
    params.require(:template).permit(:name)
  end 
end

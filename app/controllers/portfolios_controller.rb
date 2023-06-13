class PortfoliosController < ApplicationController
  layout false, only: [:index]
  before_action :authenticate_user!, except: [:index]

  before_action :find_portfolio, only: [:edit, :update, :destroy]

  def index
    @portfolio = Portfolio.where(use_as_index_page: 1).first
    return if @portfolio
    flash[:alert] = 'No portfolio is being used as index page'
    redirect_to(portfolios_path) && (return false)
  end

  def list
    @portfolios = Portfolio.all
    @default_portfolio = Portfolio.where(use_as_index_page: 1).first
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      flash[:notice] = 'Portfolio was successfully created'
      redirect_to(portfolios_path) && (return false)
    else
      flash[:alert] = 'Portfolio was not created'
      render(:new) && (return false)
    end
  end

  def edit
  end

  def update
    @portfolio.assign_attributes(portfolio_params)
    if @portfolio.save
      redirect_to(portfolios_path) && (return false)
      flash[:notice] = 'Portfolio was successfully updated'
    else
      flash[:alert] = 'Portfolio was not updated'
      render(:edit) && (return false) 
    end   
  end

  def destroy
    if @portfolio.destroy
      flash[:notice] = 'Portfolio was successfully deleted'
    else
      flash[:alert] = 'Portfolio was not deleted'
    end
    redirect_to(portfolios_path) && (return false)    
  end

  def change_default_portfolio
    Portfolio.where(use_as_index_page: 1).update_all(use_as_index_page: 0)
    @portfolio = Portfolio.where(id: params[:portfolio_id]).first
    @portfolio.update_attribute(:use_as_index_page, 1)
    flash[:notice] = 'Default Portfolio was successfully Changed'
    redirect_to(portfolios_path) && (return false)
  end

  private

  def find_portfolio
    @portfolio = Portfolio.where(id: params[:id]).first
    return if @portfolio
  end

  def portfolio_params
    params.require(:portfolio).permit(:name, :template_id)
  end  
end

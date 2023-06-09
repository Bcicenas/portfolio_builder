class PortfoliosController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  before_action :find_portfolio, only: [:edit, :update, :destroy]

  def index
  end

  def list
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      redirect_to @portfolio
      flash[:notice] = 'Portfolio was successfully created'
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
      redirect_to @portfolio
      flash[:notice] = 'Portfolio was successfully updated'
    else
      flash[:alert] = 'Portfolio was not updated'
      render(:edit) && (return false) 
    end   
  end

  def destroy
    if @portfolio.destroy
      redirect_to @portfolio
      flash[:notice] = 'Portfolio was successfully deleted'
    else
      flash[:alert] = 'Portfolio was not deleted'
      render(:edit) && (return false) 
    end    
  end

  private

  def find_portfolio
    @portfolio = Portfolio.where(id: params[:id]).first
    return if @portfolio
  end

  def portfolio_params
    params.require(:portfolio).permit(:name)
  end  
end

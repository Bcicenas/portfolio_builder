class PortfoliosController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def list
  end
end

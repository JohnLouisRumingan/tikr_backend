class CompaniesController < ApplicationController
  def index
    companies = Company.all   
    render json: companies
  end

  def show
    company = Company.find_by(id: params[:id])
    render json: company
  end
end

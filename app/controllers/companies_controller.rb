class CompaniesController < ApplicationController
  def index
    companies = Company.all   
    render json: companies
  end

  def show
    company = Company.find_by(id: params[:id])
    company_shares = Price.all.select{|price| price.company = company}
    render json: company_shares
  end
end

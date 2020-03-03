class SharesController < ApplicationController

    #only to be used in development 
    skip_before_action :verify_authenticity_token

    def index 
        shares = Share.all
        render json: shares
    end 

    # shows all the shares owned by a certain user, NOT a specific share 
    def show 
        user = User.all.find_by(id: params[:id])
        
        shares_owned_by_user = Share.all.select{|share| share.user == user}
        array_copy = []
        shares_owned_by_user.each do |share|
            share_copy = {}
            share_copy["id"] = share.id
            share_copy["symbol"] = share.company.symbol
            share_copy["purchase_date"] = share.purchase_date
            share_copy["owner"] = share.user.name
            share_copy["company_id"] = share.company.id
            share_copy["user_id"] = share.user.id
            array_copy << share_copy
        end 

        render json: array_copy
    end 


    def create

        user = User.all.find_by(id: params[:user_id])
        company = Company.all.find_by(id: params[:company_id])
        

        date_purchased = Time.now.to_s[0...10]
        
        new_share = Share.new
        new_share.company = company
        new_share.user = user 
        new_share.purchase_date = date_purchased

        new_share.save
        # byebug

        share_copy = {}
        share_copy["id"] = new_share.id
        share_copy["symbol"] = new_share.company.symbol
        share_copy["purchase_date"] = new_share.purchase_date
        share_copy["owner"] = new_share.user.name
        share_copy["company_id"] = new_share.company.id
        share_copy["user_id"] = new_share.user.id
        render json: share_copy
    end
end

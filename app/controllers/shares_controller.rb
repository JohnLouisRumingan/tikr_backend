class SharesController < ApplicationController

    def index 
        shares = Share.all
        render json: shares
    end 

    # shows all the shares owned by a certain user, NOT a specific share 
    def show 
        user = User.all.find_by(id: params[:id])
        
        shares_owned_by_user = Share.all.select{|share| share.user = user}

        array_copy = []
        shares_owned_by_user.each do |share|
            share_copy = {}
            share_copy["symbol"] = share.company.symbol
            share_copy["purchase_date"] = share.purchase_date
            share_copy["owner"] = share.user.name
            share_copy["company_id"] = share.company.id
            array_copy << share_copy
        end 

        render json: array_copy
    end 
end

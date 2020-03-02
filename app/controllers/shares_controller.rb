class SharesController < ApplicationController

    def index 
        shares = Share.all
        render json: shares
    end 

    # shows all the shares owned by a certain user, NOT a specific share 
    def show 
        user = User.all.find_by(id: params[:id])
        
        shares_owned_by_user = Share.all.select{|share| share.user = user}
        render json: shares_owned_by_user
    end 
end

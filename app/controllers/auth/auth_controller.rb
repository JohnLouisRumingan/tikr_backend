class Auth::AuthController < ApplicationController

    #only to be used in development 
    skip_before_action :verify_authenticity_token

    def fake_create
        user = User.find_by(name: params["username"]) 

        if user 
            render json: {found: true, user: user}
        else
            render json: {found: false, user: "none"}
        end
    end 
end 
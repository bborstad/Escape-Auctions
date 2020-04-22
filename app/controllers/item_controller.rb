class ItemController < ApplicationController
    before_action :require_permission, only [:edit, :update, :destroy]

    def before_action
        auction = Item.find(params[:id]).auction
        if auction.user != current_user
            redirect_to auction_path(auction), flash { error: "You do not have permission to do that."}
        end
    end
end

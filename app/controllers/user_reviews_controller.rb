class UserReviewsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        auctions = current_user.auctions
        respond_to do |format|
            format.html { render :index, locals: {auctions: auctions } }
        end
    end
    
    def submission
        required = [:name, :email, :reply, :message]
        form_complete = true
        required.each do |f|
            if params.has_key? f and not params[f].blank?
                # do nothing
            else
                form_complete = false
            end
        end
        if form_complete
            form_status_msg = 'Thank you for your review.'
        else    
            form_status_msg = 'Please fill in all fields and resubmit.'
        end
        respond_to do |format|
            format.html {
                flash.now[:status_msg] = form_status_msg
                render :update, locals: {feedback: params}}
        end
    end

    def update
        respond_to do |format|
            format.html { render :update, locals: {feedback: {} } }
        end
    end

     
end
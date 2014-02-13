class PurchaseStocksController < ApplicationController
	before_filter :authenticate_user!
	
	def show
		@purchase = Purchase.where(:id => params[:id]).first
		@purchase_stock = PurchaseStock.where(:purchase_id => @purchase.id) 

		if (! @purchase)
			respond_to do |format|
    		format.html { redirect_to orders_url, :notice => 'Purchase does not exist. You are being redirected...'  }
    		format.json { head :no_content }
  		end
	  end
	end

	def edit
		@purchase = Purchase.where(:id => params[:id]).first
		@purchase.inspect
	end

	def update
		@purchase = Purchase.where(:id => params[:id]).first
		respond_to do |format|
			if @purchase.update_attributes(params[:purchase])
				format.html { redirect_to @purchase, :notice => 'Purchase was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @purchase.errors, :status => :unprocessable_entity }
			end
		end
	end
end

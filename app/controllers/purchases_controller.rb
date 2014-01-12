class PurchasesController < ApplicationController
	def index
	 	@purchases = Purchase.where(:contact_id => params[:contact_id])
	 	@contact = Contact.where(:id => params[:contact_id]).first
		respond_to do |format|
      format.html # show default view
  		format.json {render :json => @purchases}
		end
	end

	def create
		@purchase = Purchase.new(params[:purchase])
		respond_to do |format|
			if (@purchase.save)
      	format.html {redirect_to @purchase, :notice => 'Purchase was successfully added.' }
  			format.json {render :json => @purchase}
  		else
  			format.html {render :action => "new"}
  			format.json {render :json => @purchase.errors, :status => :unprocessable_entity}
  		end 
		end
	end
	
	def new
		@purchase = Purchase.new(contact_id: params[:format])
		@stone_type = ["Emerald","Ruby","Saffire","Diamond","Topaz","Pearl","Garnate","Others"]
		@sub_type = ["Ring Size","Setting Size","Beads"]
		@shape_type = ["Round", "Oval", "Star", "Square"]
	end

	def show
		@purchase = Purchase.where(:id => params[:id]).first

		if (! @purchase)
			respond_to do |format|
    		format.html { redirect_to purchases_url, :notice => 'Purchase does not exist. You are being redirected...'  }
    		format.json { head :no_content }
  		end
	  end
	end

	def edit
		@purchase = Purchase.where(:id => params[:id]).first
		@stone_type = ["Emerald","Ruby","Saffire","Diamond","Topaz","Pearl","Garnate","Others"]
		@sub_type = ["Ring Size","Setting Size","Beads"]
		@shape_type = ["Round", "Oval", "Star", "Square"]
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

	def destroy
		@purchase = Purchase.where(:id => params[:id]).first

		@purchase.destroy

   		respond_to do |format|
    		format.html { redirect_to purchases_url }
    		format.json { head :no_content }
  		end
	end
end

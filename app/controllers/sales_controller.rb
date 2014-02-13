class SalesController < ApplicationController
	before_filter :authenticate_user!
	
	def index
	 	@sales = Sale.where(:contact_id => params[:contact_id])
		respond_to do |format|
      format.html # show default view
  		format.json {render :json => @sales}
		end
	end

	def create
		@sale = Sale.new(params[:sale])
		@sale_type = ["Approval Memo","Return","Final","Others"]
		
		respond_to do |format|
			if (! @sale.stock)
				format.html {render :action => "new", :notice => 'Stock does not exist.'}
  			format.json {render :json => @sale.errors, :status => :unprocessable_entity}
			elsif (@sale.save)
      	format.html {redirect_to @sale, :notice => 'Sale was successfully added.' }
  			format.json {render :json => @sale}
  		else
  			format.html {render :action => "new"}
  			format.json {render :json => @sale.errors, :status => :unprocessable_entity}
  		end 
		end
	end
	
	def new
		@sale = Sale.new(contact_id: params[:format])
		@sale_type = ["Approval Memo","Return","Final","Others"]
	end

	def show
		@sale = Sale.where(:id => params[:id]).first

		if (! @sale)
			respond_to do |format|
    		format.html { redirect_to sales_url, :notice => 'Sale does not exist. You are being redirected...'  }
    		format.json { head :no_content }
  		end
	  end
	end

	def edit
		@sale = Sale.where(:id => params[:id]).first
		@sale_type = ["Approval Memo","Return","Final","Others"]
	end

	def update
	    @sale = Sale.where(:id => params[:id]).first

	    respond_to do |format|
	      if @sale.update_attributes(params[:sale])
	        format.html { redirect_to @sale, :notice => 'Sale was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @sale.errors, :status => :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@sale = Sale.where(:id => params[:id]).first

		@sale.destroy

   		respond_to do |format|
    		format.html { redirect_to sales_url }
    		format.json { head :no_content }
  		end
	end	
end

class StocksController < ApplicationController
	before_filter :authenticate_user!
	
	def index
	 	@stocks = Stock.all
		respond_to do |format|
      format.html # show default view
  		format.json {render :json => @stocks}
		end
	end

	def create
		@stock = Stock.new(params[:stock])
		respond_to do |format|
			if (@stock.save)
      	format.html {redirect_to @stock, :notice => 'Stock was successfully added.' }
  			format.json {render :json => @stock}
  		else
  			format.html {render :action => "new"}
  			format.json {render :json => @stock.errors, :status => :unprocessable_entity}
  		end 
		end
	end
	
	def new
		@stock = Stock.new
		@stone_type = ["Emerald","Ruby","Saffire","Diamond","Topaz","Pearl","Garnate","Others"]
		@sub_type = ["Ring Size","Setting Size","Beads"]
		@shape_type = ["Round", "Oval", "Star", "Square"]
	end

	def show
		@stock = Stock.where(:id => params[:id]).first

		if (! @stock)
			respond_to do |format|
    		format.html { redirect_to stocks_url, :notice => 'Stock does not exist. You are being redirected...'  }
    		format.json { head :no_content }
  		end
	  end
	end

	def edit
		@stock = Stock.where(:id => params[:id]).first
		@stone_type = ["Emerald","Ruby","Saffire","Diamond","Topaz","Pearl","Garnate","Others"]
		@sub_type = ["Ring Size","Setting Size","Beads"]
		@shape_type = ["Round", "Oval", "Star", "Square"]
	end

	def update
	    @stock = Stock.where(:id => params[:id]).first

	    respond_to do |format|
	      if @stock.update_attributes(params[:stock])
	        format.html { redirect_to @stock, :notice => 'Stock was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @stock.errors, :status => :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@stock = Stock.where(:id => params[:id]).first

		@stock.destroy

   		respond_to do |format|
    		format.html { redirect_to stocks_url }
    		format.json { head :no_content }
  		end
	end	
end

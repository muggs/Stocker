class OrdersController < ApplicationController
	def index
	 	@orders = Order.where(:contact_id => params[:contact_id])
	 	@contact = Contact.where(:id => params[:contact_id]).first
		respond_to do |format|
      format.html # show default view
  		format.json {render :json => @orders}
		end
	end

	def create
		@order = Order.new(params[:order])
		respond_to do |format|
			if (@order.save)
      	format.html {redirect_to @order, :notice => 'Order was successfully added.' }
  			format.json {render :json => @order}
  		else
  			format.html {render :action => "new"}
  			format.json {render :json => @order.errors, :status => :unprocessable_entity}
  		end 
		end
	end
	
	def new
		@order = Order.new(contact_id: params[:contact_id], order_date: Date.today.to_s)
		@order_type = ["Sale","Approval Memo"]
	end

	def show
		@order = Order.where(:id => params[:id]).first
		@order_detail = OrderDetail.where(:order_id => @order.id) 

		if (! @order)
			respond_to do |format|
    		format.html { redirect_to orders_url, :notice => 'Order does not exist. You are being redirected...'  }
    		format.json { head :no_content }
  		end
	  end
	end

	def edit
		@order = Order.where(:id => params[:id]).first
		@order_type = ["Sale","Approval Memo"]
	end

	def update
	    @order = Order.where(:id => params[:id]).first

	    respond_to do |format|
	      if @order.update_attributes(params[:order])
	        format.html { redirect_to @order, :notice => 'Order was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @order.errors, :status => :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@order = Order.where(:id => params[:id]).first

		@order.destroy

   		respond_to do |format|
    		format.html { redirect_to orders_url }
    		format.json { head :no_content }
  		end
	end
end

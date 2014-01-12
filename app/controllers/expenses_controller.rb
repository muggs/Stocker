class ExpensesController < ApplicationController
	def index
	 	@expenses = Expense.all
		respond_to do |format|
      format.html # show default view
  		format.json {render :json => @expenses}
		end
	end

	def create
		@expense = Expense.new(params[:expense])
		respond_to do |format|
			if (@expense.save)
      	format.html {redirect_to @expense, :notice => 'Expense was successfully added.' }
  			format.json {render :json => @expense}
  		else
  			format.html {render :action => "new"}
  			format.json {render :json => @expense.errors, :status => :unprocessable_entity}
  		end 
		end
	end
	
	def new
		@expense = Expense.new(:user_id => current_user.id)
	end

	def show
		@expense = Expense.where(:id => params[:id]).first

		if (! @expense)
			respond_to do |format|
    		format.html { redirect_to expenses_url, :notice => 'expense does not exist. You are being redirected...'  }
    		format.json { head :no_content }
  		end
	  end
	end

	def edit
		@expense = Expense.where(:id => params[:id]).first
	end

	def update
	    @expense = Expense.where(:id => params[:id]).first

	    respond_to do |format|
	      if @expense.update_attributes(params[:expense])
	        format.html { redirect_to @expense, :notice => 'expense was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @expense.errors, :status => :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@expense = Expense.where(:id => params[:id]).first

		@expense.destroy

   		respond_to do |format|
    		format.html { redirect_to expenses_url }
    		format.json { head :no_content }
  		end
	end
end


class ContactsController < ApplicationController
	before_filter :authenticate_user!	
	
	def create
		@contact = Contact.new(params[:contact])
		respond_to do |format|
			if (@contact.save)
      	format.html {redirect_to @contact, :notice => 'Contact was successfully added.' }
  			format.json {render :json => @contact}
  		else
  			format.html {render :action => "new"}
  			format.json {render :json => @contact.errors, :status => :unprocessable_entity}
  		end 
		end
	end
	
	def new
		@contact = Contact.new
		if params[:contact_type]
			@contact_type = params[:contact_type]
		else
			@contact_type = "Others"
		end
	end

	def show
		@contact = Contact.where(:id => params[:id]).first

		if (! @contact)
			respond_to do |format|
    		format.html { redirect_to contacts_url, :notice => 'Contact does not exist. You are being redirected...'  }
    		format.json { head :no_content }
  		end
	  end
	end

	def edit
		@contact = Contact.where(:id => params[:id]).first
		@contact_type = @contact.contact_type
	end

	def update
	    @contact = Contact.where(:id => params[:id]).first

	    respond_to do |format|
	      if @contact.update_attributes(params[:contact])
	        format.html { redirect_to @contact, :notice => 'Contact was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @contaact.errors, :status => :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@contact = Contact.where(:id => params[:id]).first

		@contact.destroy

   		respond_to do |format|
    		format.html { redirect_to pages_index_path }
    		format.json { head :no_content }
  		end
	end
end

class CustomersController < ApplicationController
  def index
  	if params[:search]
 			@customers = Contact.where(:contact_type => "Customer").where('name LIKE ?', "%#{params[:search]}%")
			respond_to do |format|
				format.html # show default view
				format.json {render :json => @customers}
			end			
		else
			@customers = []
		end		
  end
end

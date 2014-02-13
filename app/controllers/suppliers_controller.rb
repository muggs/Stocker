class SuppliersController < ApplicationController
	before_filter :authenticate_user!
	
  def index
  	if params[:search]
 			@suppliers = Contact.where(:contact_type => "Supplier").where('name LIKE ?', "%#{params[:search]}%")
			respond_to do |format|
				format.html # show default view
				format.json {render :json => @suppliers}
			end			
		else
			@suppliers = []
		end	
  end
end

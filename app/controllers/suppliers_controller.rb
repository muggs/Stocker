class SuppliersController < ApplicationController
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

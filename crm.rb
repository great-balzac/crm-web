require 'sinatra'
require 'data_mapper' # Initialize connection to database
require_relative 'rolodex'

DataMapper.setup(:default, "sqlite3:database.sqlite3") # Initialize connection to databse

class Contact

	include DataMapper::Resource

	property :id, Serial
	property :fname, String
	property :lname, String
	property :email, String
	property :notes, String

end # class Contact

DataMapper.finalize
DataMapper.auto_upgrade!

$rolodex = Rolodex.new # Set a global variable to allow acces from each action in Sinatra


# ===== ROUTES =====

get '/' do		# Root directory
	@crm_app_name = "My CRM"	# Instance variable containing application name that can be read by index.erb
	erb :index	# Refers to the main page, index.erb
end


# Refers to contacts.erb
get '/contacts' do
	@contacts = Contact.all
	erb :contacts
end

# Add a new contact
get '/contacts/new' do
	erb :new_contact
end

get "/contacts/:id" do
	@contact = Contact.get(params[:id].to_i)
	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound		# Sinatra 404 page
	end # if @contact
end

get "/contacts/:id/edit" do
	@contact = Contact.get(params[:id].to_i)
	if @contact
		erb :edit_contact
	else
		raise Sinatra::NotFound
	end
end # get "/contacts/:id/edit"

put "/contacts/:id" do
	@contact = Contact.get(params[:id].to_i)
	if @contact
		@contact.update(:fname => params[:fname],
			:lname => params[:lname],
			:email => params[:email],
			:notes => params[:notes]
			)

		redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end # put "/contacts/:id"

delete "/contacts/:id" do
	@contact = Contact.get(params[:id].to_i)
	if @contact
		@contact.destroy
		redirect to("/contacts")  # After deletion, returns to contacts main page
	else
		raise Sinatra::NotFound
	end
end # delete "/contacts/:id"

post '/contacts' do
	new_contact = Contact.create(
		:fname => params[:fname],
		:lname => params[:lname],
		:email => params[:email],
		:notes => params[:notes]
		)

	redirect to('/contacts')	# Redirects to display contacts page
end
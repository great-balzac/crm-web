require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

$rolodex = Rolodex.new # Set a global variable to allow acces from each action in Sinatra

# temp fake data
$rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))
$rolodex.add_contact(Contact.new("Cornholio", "Great", "bungmuch@bitmakerlabs.com", "From Lake Titticaca"))
$rolodex.add_contact(Contact.new("Rodney", "Johnson", "DG@bitmakerlabs.com", "Shower cap tester"))

# ===== ROUTES =====

get '/' do		# Root directory
	@crm_app_name = "My CRM"	# Instance variable containing application name that can be read by index.erb
	erb :index	# Refers to the main page, index.erb
end


# Refers to contacts.erb
get '/contacts' do
	erb :contacts
end

# Add a new contact
get '/contacts/new' do
	erb :new_contact
end

get "/contacts/:id" do
	@contact = $rolodex.find_contact(params[:id].to_i)
	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound		# Sinatra 404 page
	end # if @contact
end

get "/contacts/:id/edit" do
	@contact = $rolodex.find(params[:id].to_i)
	if @contact
		erb :edit_contact
	else
		raise Sinatra::NotFound
	end
end # get "/contacts/:id/edit"

put "/contacts/:id" do
	@contact = $rolodex.find_contact(params[:id].to_i)
	if @contact
		@contact.fname = params[:fname]
		@contact.lname = params[:lname]
		@contact.email = params[:email]
		@contact.notes = params[:notes]

		redirect to("/contacts")
	else
		raise Sinatra::NotFound
	end
end # put "/contacts/:id"

delete "/contacts/:id" do
	@contact = $rolodex.find_contact(params[:id].to_i)
	if @contact
		$rolodex.remove_contact(@contact)
		redirect to("/contacts")  # After deletion, returns to contacts main page
	else
		raise Sinatra::NotFound
	end
end # delete "/contacts/:id"

# Server responds to the POST method and creates a resource
# with the data submitted from new_contact.erb
post '/contacts' do
	# puts params
	new_contact = Contact.new(params[:fname], params[:lname], params[:email], params[:notes])
	$rolodex.add_contact(new_contact)
	redirect to('/contacts')	# Redirects to display contacts page
end
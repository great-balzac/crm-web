require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

$rolodex = Rolodex.new # Set a global variable to allow acces from each action in Sinatra

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


require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'

get '/' do		# Root directory
	@crm_app_name = "My CRM"	# Instance variable containing application name that can be read by index.erb
	erb :index	# Refers to the main page, index.erb
end


# Refers to contacts.erb
get '/contacts' do
	# Fake data for testing
	@contacts = []
	@contacts << Contact.new(1000, "Yehuda", "Katz", "yehuda@example.com", "Developer")
	@contacts << Contact.new(1001, "Mark", "Zuckerberg", "mark@facebook.com", "CEO")
 	@contacts << Contact.new(1002, "Sergey", "Brin", "sergey@google.com", "Co-Founder")

	erb :contacts
end

# Add a new contact
get 'contacts/new' do
	# insert page ref here
end


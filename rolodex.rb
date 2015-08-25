require_relative 'contact.rb'

class Rolodex
	
	def initialize
		@contacts = []
		@id = 1000

	end # initialize

	def add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
	end # def add_contact

end # class Rolodex
require_relative 'contact.rb'

class Rolodex
	attr_reader :contacts

	def initialize
		@contacts = []
		@id = 1000

	end # initialize

	def add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
	end # def add_contact

	def find_contact(contact_id)
		# .find is a method that belongs to enumerable module
		@contacts.find {|contact| contact.id == contact_id}
	end #find(contact_id)

end # class Rolodex
require_relative './contact.rb'

class Rolodex
	@@id = 1000

	def initialize
		@contacts = []
	end # initialize

	def add_contact(fname, lname, email, notes)
		contact = Contact.new(@@id, fname, lname, email, notes)
		@@id += 1

		@contacts << contact
	end # def add_contact

	# def all
	# 	@contacts
	# end # def all

	# def select(id_num)
	# 	correct_index = @contacts.index {|contact| contact.id == id_num}
	# 	if correct_index != nil
	# 		return @contacts.fetch(correct_index)
	# 	else
	# 	end # if correct_index 
	# end # def search

	# def delete_contact(id_num)
	# 	correct_index = @contacts.index {|contact| contact.id == id_num}
	# 	if correct_index != nil
	# 		return @contacts.delete_at(correct_index)
	# 	else
	# 	end # if correct_index
	# end # def delete_contact

	# def modify_contact(id_num, att_to_modify, new_att_value)
	# 	selected_contact = select(id_num)

	# 	case att_to_modify
	# 	when att_to_modify=1
	# 		selected_contact.fname = new_att_value
	# 		return selected_contact
	# 	when att_to_modify=2
	# 		selected_contact.lname = new_att_value
	# 		return selected_contact
	# 	when att_to_modify=3
	# 		selected_contact.email = new_att_value
	# 		return selected_contact
	# 	when att_to_modify=4
	# 		selected_contact.notes = new_att_value
	# 		return selected_contact
	# 	else
	# 	end # case

	# end # def modify_contact

	# def display_attribute(id_num, att_to_display)
	# 	selected_contact = select(id_num)

	# 	case att_to_display
	# 	when att_to_display=1
	# 		return selected_contact.fname
	# 	when att_to_display=2
	# 		return selected_contact.lname
	# 	when att_to_display=3
	# 		return selected_contact.email
	# 	when att_to_display=4
	# 		return selected_contact.notes
	# 	else
	# 	end # case

	# end # display_attribute

end # class Rolodex
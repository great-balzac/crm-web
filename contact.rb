class Contact
	attr_accessor :id, :fname, :lname, :email, :notes

	def initialize(id, fname, lname, email, notes)
		@id = id
		@fname = fname
		@lname = lname
		@email = email
		@notes = notes

	end # def initialize

end # class Contact
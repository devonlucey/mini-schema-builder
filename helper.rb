require_relative 'printer.rb'
require_relative 'templates.rb'
require 'json'

class Helper

	#Promt user displays a welcome message and asks what needs to be done. Future content includes a search feature.
	def promptUser()
		puts "\nWelcome to the Schema Builder\nWould you like to create a new schema or search?"
		response = gets.chomp
		if response.include? "new"
			puts "Okay, new schema"
			Printer.newSchemaPrint()
			return File.readlines("newSchema.json")
		# elsif response.include? "search"
		# 	puts "Okay, redirecting."
		# 	Helper.new.search()
		else
			exit
		end
	end

	#Gets the number of groups a user would like to make. This requires some changes for efficiency.
	def groupNumber()
		puts "How many groups do you need?"
		groupResponse = gets.chomp
	end

	#Asks what type of group to print and calls the printer. Needs to be looped for multiple group types.
	def printGroups(groups, newSchema)

		puts "Select a group type for this print: generic or media"
		response = gets.chomp

		if response.include? "generic"
			placeholder = Printer.genericGroupPrint(groups, newSchema)
		elsif response.include? "media"	
			placeholder = Printer.mediaGroupPrint(groups, newSchema)
		end

		return placeholder
	end

	#Asks what group to edit and then moves to that group. Once in that group asks number and type of fields to add.
	def findGroup(placeholder)
		puts "Do you need to find a group?"
		response = gets.chomp
		if response.include? "y"
			puts "Okay, there are #{placeholder.length} groups, which group would you like to edit?"
			selectedGroup = gets.chomp.to_i

			puts "How many fields to add?"
				fieldsToAdd = gets.chomp.to_i

			puts "What type of field(s) are you going to add:\nsingle-line, multi-line, photo, photo-with-description, or choice?"
			case response = gets.chomp
			when "single-line"
				placeholder = Printer.singleLinePrint(selectedGroup, fieldsToAdd, placeholder)
			when "multi-line"
				placeholder = Printer.multiLinePrint(selectedGroup, fieldsToAdd, placeholder)
			when "photo"
				placeholder = Printer.photosPrint(selectedGroup, fieldsToAdd, placeholder)
			when "photo-with-description"
				placeholder = Printer.photoWithDescriptionPrint(selectedGroup, fieldsToAdd, placeholder)
			when "choice"
				placeholder = Printer.choicePrint(selectedGroup, fieldsToAdd, placeholder)
			end		
				findGroup(placeholder)
		end
		return placeholder
	end

	#Future Content
	# def search()
	# 	puts "Search parameters include \"new\", \"edit\", and \"help\""
	# end
end

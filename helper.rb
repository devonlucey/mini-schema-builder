require_relative 'printer.rb'
require 'json'

class Helper

	#Called to start building a new schema.
	def buildNewSchema(newSchema)
		addReferenceNumber(newSchema)
	end

	#Optional reference number.
	def addReferenceNumber(newSchema)
		puts "Would you like to add a reference number?\nyes || no"
		response = gets.chomp
		if response == "yes"
			newSchema = Printer.referenceNumberPrint(newSchema)
			addAddress(newSchema)
		else
			addAddress(newSchema)
		end
	end

	#Optional address box.
	def addAddress(newSchema)
		puts "Would you like to add an address box?\nyes || no"
		response = gets.chomp
		if response == "yes"
			newSchema = Printer.addressBoxPrint(newSchema)
			addOnsiteContact(newSchema)
		else
			addOnsiteContact(newSchema)
		end
	end

	#Optional onsite contact.
	def addOnsiteContact(newSchema)
		puts "Would you like to add an onsite contact?\nyes || no"
		response = gets.chomp
		if response == "yes"
			newSchema = Printer.onsiteContactPrint(newSchema)
			getNumberOfGroups(newSchema, 0)
		else
			getNumberOfGroups(newSchema, 0)
		end
	end

	#Gets the number of groups a user would like to make. This requires some changes for efficiency.
	def getNumberOfGroups(newSchema, count)
		if count == 0
			puts "How many groups do you need?"
			groupResponse = gets.chomp.to_i
			printGroups(groupResponse, newSchema)
			count += 1
		else
			puts "Do you need to add more/different groups?\nyes || no"
			response = gets.chomp
			if response == "yes"
				getNumberOfGroups(newSchema, 0)
			elsif response == "no"
				findGroup(newSchema)
			end
		end
	end

	#Asks what type of group to print and calls the printer. Needs to be looped for multiple group types.
	def printGroups(groups, newSchema)

		puts "Select a group type for this print:\ngeneric || media"
		response = gets.chomp

		if response.include? "generic"
			newSchema = Printer.genericGroupPrint(groups, newSchema)
		elsif response.include? "media"	
			newSchema = Printer.mediaGroupPrint(groups, newSchema)
		end
		findGroup(newSchema)
	end

	#Asks what group to edit and then moves to that group. Once in that group asks number and type of fields to add.
	def findGroup(newSchema)
		puts "Do you need to find a group?\nyes || no"
		response = gets.chomp
		if response.include? "y"
			puts "Okay, there are #{newSchema['fields'].length} groups, which group would you like to edit?"
			selectedGroup = gets.chomp.to_i
			addFields(selectedGroup, newSchema)
		else
			newSchema = newSchema.to_s.gsub(/=>/, ":")
			File.write("newSchema.json", newSchema)
			exit
		end
	end

	#Requests the number of fields and type of fields to add and then prints them accordingly.
	#Makes a call back to getNumberOfGroups if more groups and fields are needed.
	def addFields(selectedGroup, newSchema)
	puts "How many fields to add?"
	fieldsToAdd = gets.chomp.to_i

	puts "What type of field(s) are you going to add?:\nsingle-line || multi-line || photo || photo-with-description || choice"
		case response = gets.chomp
		when "single-line"
			newSchema = Printer.singleLinePrint(selectedGroup, fieldsToAdd, newSchema)
		when "multi-line"
			newSchema = Printer.multiLinePrint(selectedGroup, fieldsToAdd, newSchema)
		when "photo"
			newSchema = Printer.photosPrint(selectedGroup, fieldsToAdd, newSchema)
		when "photo-with-description"
			newSchema = Printer.photoWithDescriptionPrint(selectedGroup, fieldsToAdd, newSchema)
		when "choice"
			newSchema = Printer.choicePrint(selectedGroup, fieldsToAdd, newSchema)
		end		
			getNumberOfGroups(newSchema, 1)
	end
end

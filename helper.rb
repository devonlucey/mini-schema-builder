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
			newSchema['fields'] += Printer.createGenericGroup(groups)
		elsif response.include? "media"	
			newSchema['fields'] += Printer.createMediaGroup(groups)
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
			
			if checkForClientOrLooker() == 0
				addClientFields(selectedGroup, newSchema)
			else
				addLookerFields(selectedGroup, newSchema)
			end
		else
			completeAndWriteSchema(newSchema)
		end
	end

	#Checks to see if the fields will be used by the client or looker and returns a value to findGroup
	def checkForClientOrLooker()
		puts "Will the fields in this group be used by clients or lookers?\nclient || looker"
		response = gets.chomp
		if response == "client"
			return 0
		elsif response == "looker"
			return 1
		else
			puts "I didn't catch that, please try again."
			checkForClientOrLooker()
		end
	end

	#Requests the number of fields and type of fields to add and then prints them accordingly.
	#Makes a call back to getNumberOfGroups if more groups and fields are needed.
	def addClientFields(selectedGroup, newSchema)
		puts "How many client fields to add?"
		fieldsToAdd = gets.chomp.to_i

		puts "What type of field(s) are you going to add?:\nsingle-line || multi-line || checkbox || map || choice"
		case response = gets.chomp
			when "single-line"
				newSchema['fields'][selectedGroup - 1]['fields'] += Printer.createClientSingleLine(fieldsToAdd)
			when "multi-line"
				newSchema['fields'][selectedGroup - 1]['fields'] += Printer.createClientMultiLine(fieldsToAdd)
			when "checkbox"
				newSchema['fields'][selectedGroup - 1]['fields'] += Printer.createClientCheckBox(fieldsToAdd)
			when "map"
				newSchema['fields'][selectedGroup - 1]['fields'] += Printer.createClientMap(fieldsToAdd)
			when "choice"
				newSchema['fields'][selectedGroup - 1]['fields'] += Printer.createClientChoice(fieldsToAdd)
			end		
		getNumberOfGroups(newSchema, 1)
	end

	#Requests the number of fields and type of fields to add and then prints them accordingly.
	#Makes a call back to getNumberOfGroups if more groups and fields are needed.
	def addLookerFields(selectedGroup, newSchema)
		puts "How many looker fields to add?"
		fieldsToAdd = gets.chomp.to_i

		puts "What type of field(s) are you going to add?:\nsingle-line || multi-line || photo || photo-with-description || choice"
		case response = gets.chomp
			when "single-line"
				newSchema['fields'][selectedGroup - 1]['fields'] += Printer.createLookerSingleLine(fieldsToAdd)
			when "multi-line"
				newSchema['fields'][selectedGroup - 1]['fields'] += Printer.createLookerMultiLine(fieldsToAdd)
			when "photo"
				newSchema['fields'][selectedGroup - 1]['fields'] += Printer.createLookerPhotos(fieldsToAdd)
			when "photo-with-description"
				newSchema['fields'][selectedGroup - 1]['fields'] += Printer.createLookerPhotoWithDescription(fieldsToAdd)
			when "choice"
				newSchema['fields'][selectedGroup - 1]['fields'] += Printer.createLookerChoice(fieldsToAdd)
			end		
		getNumberOfGroups(newSchema, 1)
	end

	def completeAndWriteSchema(newSchema)
		puts "Adding Looker Instructions and Delivery Options."
		newSchema = Printer.lookerInstructions(newSchema)
		newSchema = Printer.deliveryOptions(newSchema)

		newSchema = newSchema.to_s.gsub(/=>/, ":")
		File.write("newSchema.json", newSchema)
		exit
	end
end

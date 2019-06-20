require_relative 'templates.rb'

class Printer

##########################################################################################################################
	#Groups Printers

	#Prints the media group template based on number requested.
	def self.createMediaGroup(number)
		(1..number).map { |n| Templates.mediaGroup() }
	end

	#Prints the generic group template based on number requested.
	def self.createGenericGroup(number)
		(1..number).map { |n| Templates.genericGroup() }
	end

##########################################################################################################################
	#Order Information Printers

	#Prints the reference number template.
	def self.referenceNumberPrint(newSchema)
		newSchema['fields'] << Templates.referenceNumber()
		return newSchema
	end

	#Prints the address box template.
	def self.addressBoxPrint(newSchema)
		newSchema['fields'] << Templates.addressBox()
		return newSchema
	end

	#Prints the onsite contact template.
	def self.onsiteContactPrint(newSchema)
		newSchema['fields'] << Templates.onsiteContact()
		return newSchema
	end

	#Prints the looker instructions.
	def self.lookerInstructions(newSchema)
		newSchema['fields'] << Templates.lookerInstructions()
		return newSchema
	end

	#Prints the delivery options.
	def self.deliveryOptions(newSchema)
		newSchema['fields'] << Templates.deliveryOptions()
		return newSchema
	end

##########################################################################################################################
	#Client Fields Printers

	#Prints the photo field template based on number requested.
	def self.createClientCheckBox(number)
		(1..number).map { |n| Templates.clientCheckBox() }
	end

	#Prints the single-line field template based on number requested.
	def self.createClientSingleLine(number)
		(1..number).map { |n| Templates.clientSingleLine() }
	end

	#Prints the photoWithDescription field template based on number requested.
	def self.createClientMap(number)
		(1..number).map { |n| Templates.clientMap() }
	end

	#Prints the multi-line field template based on number requested.
	def self.createClientMultiLine(number)
		(1..number).map { |n| Templates.clientMultiLine() }
	end

	#Prints the choice field template based on number requested.
	def self.createClientChoice(number)
		(1..number).map { |n| Templates.clientChoice() }
	end

##########################################################################################################################
	#Looker Fields Printers

	#Prints the photo field template based on number requested.
	def self.createLookerPhotos(number)
		(1..number).map { |n| Templates.lookerPhoto() }
	end

	#Prints the single-line field template based on number requested.
	def self.createLookerSingleLine(number)
		(1..number).map { |n| Templates.lookerSingleLine() }
	end

	#Prints the photoWithDescription field template based on number requested.
	def self.createLookerPhotoWithDescription(number)
		(1..number).map { |n| Templates.lookerPhotoWithDescription() }
	end

	#Prints the multi-line field template based on number requested.
	def self.createLookerMultiLine(number)
		(1..number).map { |n| Templates.lookerMultiLine() }
	end

	#Prints the choice field template based on number requested.
	def self.createLookerChoice(number)
		(1..number).map { |n| Templates.lookerChoice() }
	end

	######################################################################################################################
end
require_relative 'templates.rb'

class Printer

	#Prints the media group template based on number requested.
	def self.mediaGroupPrint(number, newSchema)
		c = 0
		while c < number
				newSchema['fields'] = newSchema['fields'] << Templates.mediaGroup()
		c += 1
		end
		return newSchema
	end

	#Prints the generic group template based on number requested.
	def self.genericGroupPrint(number, newSchema)
		c = 0
		while c < number
				newSchema['fields'] = newSchema['fields'] << Templates.genericGroup()
		c += 1
		end
		return newSchema
	end

##########################################################################################################################

	#Prints the reference number template.
	def self.referenceNumberPrint(newSchema)
		newSchema['fields'] = newSchema['fields'] << Templates.referenceNumber()
		return newSchema
	end

	#Prints the address box template.
	def self.addressBoxPrint(newSchema)
		newSchema['fields'] = newSchema['fields'] << Templates.addressBox()
		return newSchema
	end

	#Prints the onsite contact template.
	def self.onsiteContactPrint(newSchema)
		newSchema['fields'] = newSchema['fields'] << Templates.onsiteContact()
		return newSchema
	end

	#Prints the looker instructions.
	def self.lookerInstructions(newSchema)
		newSchema['fields'] = newSchema['fields'] << Templates.lookerInstructions()
		return newSchema
	end

	#Prints the delivery options.
	def self.deliveryOptions(newSchema)
		newSchema['fields'] = newSchema['fields'] << Templates.deliveryOptions()
		return newSchema
	end

##########################################################################################################################

	#Prints the photo field template based on number requested.
	def self.photosPrint(selectedGroup, fieldsToAdd, newSchema)
	c = 0
		while c < fieldsToAdd
			newSchema['fields'][selectedGroup - 1]['fields'] << Templates.lookerPhoto()
			c += 1
		end
		puts "printing #{fieldsToAdd} photos"
		return newSchema
	end

	#Prints the single-line field template based on number requested.
	def self.singleLinePrint(selectedGroup, fieldsToAdd, newSchema)
		c = 0
		while c < fieldsToAdd 
			newSchema['fields'][selectedGroup - 1]['fields'] << Templates.lookerSingleLine()
			c += 1
		end
		puts "printing #{fieldsToAdd} single-lines"
		return newSchema
	end

	#Prints the photoWithDescription field template based on number requested.
	def self.photoWithDescriptionPrint(selectedGroup, fieldsToAdd, newSchema)
	c = 0
		while c < fieldsToAdd
			newSchema['fields'][selectedGroup - 1]['fields'] << Templates.lookerPhotoWithDescription()
			c += 1
		end
		puts "printing #{fieldsToAdd} photo with descriptions"
		return newSchema
	end

	#Prints the multi-line field template based on number requested.
	def self.multiLinePrint(selectedGroup, fieldsToAdd, newSchema)
		c = 0
		while c < fieldsToAdd 
			newSchema['fields'][selectedGroup - 1]['fields'] << Templates.lookerMultiLine()
			c += 1
		end
		puts "printing #{fieldsToAdd} multi-lines"
		return newSchema
	end

	#Prints the choice field template based on number requested.
	def self.choicePrint(selectedGroup, fieldsToAdd, newSchema)
		c = 0
		while c < fieldsToAdd 
			newSchema['fields'][selectedGroup - 1]['fields'] << Templates.lookerChoice()
			c += 1
		end
		puts "printing #{fieldsToAdd} choices"
		return newSchema
	end
end
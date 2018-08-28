require_relative 'templates.rb'

class Printer

	#Prints the new schema template
	def self.newSchemaPrint()
		newSchema = File.open("newSchema.json", "w")
		File.write('newSchema.json', Templates.newSchema())
	end

	#Prints the media group template based on number requested.
	def self.mediaGroupPrint(number, newSchema)
		c = 0
		while c < number
			if c == 0
				placeholder = JSON.parse(newSchema)['fields'] << Templates.mediaGroup()
			else 
				JSON.parse(placeholder.to_json)
				placeholder = placeholder << Templates.genericGroup()
			end
		c += 1
		end
		return placeholder
	end

	#Prints the generic group template based on number requested.
	def self.genericGroupPrint(number, newSchema)
		c = 0
		while c < number
			if c == 0
				placeholder = JSON.parse(newSchema)['fields'] << Templates.genericGroup()
			else 
				JSON.parse(placeholder.to_json)
				placeholder = placeholder << Templates.genericGroup()
			end
		c += 1
		end
		return placeholder
	end

	#Prints the photo field template based on number requested.
	def self.photosPrint(selectedGroup, fieldsToAdd, placeholder)
	c = 0
		while c < fieldsToAdd
			placeholder[selectedGroup - 1]['fields'] << Templates.lookerPhoto()
			c += 1
		end
		puts "printing #{fieldsToAdd} photos"
		return placeholder
	end

	#Prints the single-line field template based on number requested.
	def self.singleLinePrint(selectedGroup, fieldsToAdd, placeholder)
		c = 0
		while c < fieldsToAdd 
			placeholder[selectedGroup - 1]['fields'] << Templates.lookerSingleLine()
			c += 1
		end
		puts "printing #{fieldsToAdd} single-lines"
		return placeholder
	end

	#Prints the photoWithDescription field template based on number requested.
	def self.photoWithDescriptionPrint(selectedGroup, fieldsToAdd, placeholder)
	c = 0
		while c < fieldsToAdd
			placeholder[selectedGroup - 1]['fields'] << Templates.lookerPhotoWithDescription()
			c += 1
		end
		puts "printing #{fieldsToAdd} photos"
		return placeholder
	end

	#Prints the multi-line field template based on number requested.
	def self.multiLinePrint(selectedGroup, fieldsToAdd, placeholder)
		c = 0
		while c < fieldsToAdd 
			placeholder[selectedGroup - 1]['fields'] << Templates.lookerMultiLine()
			c += 1
		end
		puts "printing #{fieldsToAdd} single-lines"
		return placeholder
	end

	#Prints the choice field template based on number requested.
	def self.choicePrint(selectedGroup, fieldsToAdd, placeholder)
		c = 0
		while c < fieldsToAdd 
			placeholder[selectedGroup - 1]['fields'] << Templates.lookerChoice()
			c += 1
		end
		puts "printing #{fieldsToAdd} single-lines"
		return placeholder
	end
end
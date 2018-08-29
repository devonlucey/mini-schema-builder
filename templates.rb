require 'json'

#Class used to set all templates for the printer.

class Templates

	def self.addressBox
		JSON.parse(File.readlines("./templates/location-address.json").join())
	end
	
	def self.checkBox
		JSON.parse(File.readlines("./templates/checkbox.json").join())
	end

	def self.deliveryOptions
		JSON.parse(File.readlines("./templates/delivery-options.json").join())
	end

	def self.genericGroup
		JSON.parse(File.readlines("./templates/generic-group.json").join())
	end

	def self.mediaGroup
		JSON.parse(File.readlines("./templates/media-group.json").join())
	end

	def self.lookerChoice
		JSON.parse(File.readlines("./templates/looker-choice.json").join())
	end

	def self.lookerSingleLine
		JSON.parse(File.readlines("./templates/looker-single-line.json").join())
	end

	def self.lookerMultiLine
		JSON.parse(File.readlines("./templates/looker-multi-line.json").join())
	end

	def self.lookerPhoto
		JSON.parse(File.readlines("./templates/looker-photo.json").join())
	end

	def self.lookerPhotoWithDescription
		JSON.parse(File.readlines("./templates/photo-with-description.json").join())
	end

	def self.map
		JSON.parse(File.readlines("./templates/map.json").join())
	end

	def self.onsiteContact
		JSON.parse(File.readlines("./templates/onsite-contact.json").join())
	end

	def self.referenceNumber
		JSON.parse(File.readlines("./templates/reference-number.json").join())
	end
end
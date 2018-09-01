require 'json'

#Class used to set all templates for the printer.

class Templates

##########################################################################################################################
	#Order Information

	def self.addressBox
		JSON.parse(File.readlines("./templates/order-information/location-address.json").join())
	end

	def self.deliveryOptions
		JSON.parse(File.readlines("./templates/order-information/delivery-options.json").join())
	end
	
	def self.lookerInstructions
		JSON.parse(File.readlines("./templates/order-information/looker-instructions.json").join())
	end

	def self.onsiteContact
		JSON.parse(File.readlines("./templates/order-information/onsite-contact.json").join())
	end

	def self.referenceNumber
		JSON.parse(File.readlines("./templates/order-information/reference-number.json").join())
	end

##########################################################################################################################
	#Client Fields

	def self.clientCheckBox
		JSON.parse(File.readlines("./templates/client/checkbox.json").join())
	end

	def self.clientMap
		JSON.parse(File.readlines("./templates/client/map.json").join())
	end

	def self.clientChoice
		JSON.parse(File.readlines("./templates/client/client-choice.json").join())
	end

	def self.clientSingleLine
		JSON.parse(File.readlines("./templates/client/client-single-line.json").join())
	end

	def self.clientMultiLine
		JSON.parse(File.readlines("./templates/client/client-multi-line.json").join())
	end

##########################################################################################################################
	#Groups

	def self.genericGroup
		JSON.parse(File.readlines("./templates/groups/generic-group.json").join())
	end

	def self.mediaGroup
		JSON.parse(File.readlines("./templates/groups/media-group.json").join())
	end

##########################################################################################################################
	#Looker Fields

	def self.lookerChoice
		JSON.parse(File.readlines("./templates/looker/looker-choice.json").join())
	end

	def self.lookerSingleLine
		JSON.parse(File.readlines("./templates/looker/looker-single-line.json").join())
	end

	def self.lookerMultiLine
		JSON.parse(File.readlines("./templates/looker/looker-multi-line.json").join())
	end

	def self.lookerPhoto
		JSON.parse(File.readlines("./templates/looker/looker-photo.json").join())
	end

	def self.lookerPhotoWithDescription
		JSON.parse(File.readlines("./templates/looker/photo-with-description.json").join())
	end

##########################################################################################################################
end
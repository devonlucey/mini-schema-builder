require 'json'

#Class used to set all templates for the printer.

class Templates
	
	def self.checkBox
		checkBox = JSON.parse(File.readlines("./templates/checkbox.json").join())
	end

	def self.genericGroup
		genericGroup = JSON.parse(File.readlines("./templates/generic-group.json").join())
	end

	def self.mediaGroup
		mediaGroup = JSON.parse(File.readlines("./templates/media-group.json").join())
	end

	def self.lookerChoice
		lookerChoice = JSON.parse(File.readlines("./templates/looker-choice.json").join())
	end

	def self.lookerSingleLine
		lookerSingleLine = JSON.parse(File.readlines("./templates/looker-single-line.json").join())
	end

	def self.lookerMultiLine
		lookerSingleLine = JSON.parse(File.readlines("./templates/looker-multi-line.json").join())
	end

	def self.lookerPhoto
		lookerPhoto = JSON.parse(File.readlines("./templates/looker-photo.json").join())
	end

	def self.lookerPhotoWithDescription
		lookerPhotoWithDescription = JSON.parse(File.readlines("./templates/photo-with-description.json").join())
	end

	def self.map
		map = JSON.parse(File.readlines("./templates/map.json").join())
	end

	def self.newSchema
		newSchema = JSON.parse(File.readlines("./templates/new-schema.json").join())
	end
end
require_relative 'helper.rb'

#Schema Builder V1.15  Used to start the process.
#Need to add MFM support

class App
	def initialize()
		helper = Helper.new
		puts "\nWelcome to the Schema Builder\nWould you like to create a new schema, new multifields, or search?\nIf you need to exit type \'exit\'\n\nList of preferred input:\nschema || multifields || search"
			
		case response = gets.chomp
		when "schema"
			puts "Okay, new schema"
			newSchema = File.readlines("./templates/new-schema.json").join().gsub(/=>/, ":")
			newSchema = JSON.parse(newSchema)
			helper.buildNewSchema(newSchema)
		when "multifields"
			puts "Okay, multifields\nThis feature doesn't exist currently. Exiting."
			exit
		when "search"
			puts "Okay, search\nThis feature doesn't exist currently. Exiting."
			exit
		when "exit"
			exit	
		end
	end
end
App.new.initialize()
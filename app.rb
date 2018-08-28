require_relative 'helper.rb'

#Schema Builder V1.01  Used to start the process.
#Needs more work because placeholder needs to replace newSchema['fields'] automatically instead of manual copy paste.
#Need to add MFM support

newSchema = Helper.new.promptUser().join().gsub(/=>/, ":")
groups = Helper.new.groupNumber().to_i
placeholder = Helper.new.printGroups(groups, newSchema)
placeholder = Helper.new.findGroup(JSON.parse(placeholder.to_json))

File.write("template.json", placeholder.to_json)
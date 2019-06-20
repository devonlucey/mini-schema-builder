require 'csv'

class Namer
	def readNames()
		data = CSV.read("names.csv")
		fieldNames = Array.new

		data.each do |item|
			fieldNames << item[0]
		end
		return fieldNames
	end

	def addNames(schema, names)
		i = 1
		fields = schema['fields']
		fields.each do |fields|
			if fields['type'] == "group"
				fields['fields'].each do |inner_fields|
					if inner_fields['name'].empty?
						inner_fields['name'] = names[i]
						i+=1
					end
				end
			end
		end
	end
end
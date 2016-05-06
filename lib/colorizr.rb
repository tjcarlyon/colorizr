
class String
	def self.color_options
		
			{black: 30, red: 31, green: 32, yellow: 33, blue: 34, pink: 35, light_gray: 37, light_blue: 94, white: 97}
		
	end

	# lists all available colors
	instance_eval do
		def colors
			color_options.keys
		end
	end

	# generates colors
	def self.create_colors
		color_options.each do |key, value|
			self.send(:define_method, "#{key}") do
				"\e[#{value}m#{self}\e[39m"
			end
		end
	end
	create_colors


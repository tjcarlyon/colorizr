class String
  @colors = {
                  red:        31,
                  green:      32,
                  yellow:     33,
                  blue:       34,
                  pink:       91,
                  light_blue: 94,
                  white:      97,
                  light_grey: 37,
                  black:      30
              }

  def self.create_colors
    @colors.each do |key,value|
      self.send(:define_method, "#{key.to_s}") do
        "\e[#{value.to_s}m" + self.to_s + "\e[0m"
      end
    end
  end

  String.create_colors

  def self.colors
    @colors.keys
  end

  def self.sample_colors
  	index = 1
  	puts ""
    String.colors.each do |color|
      puts "#{index} This is " + color.to_s.instance_eval(color.to_s)
      index += 1
    end
    puts ""
  end
end
 

#String.sample_colors






#reopen String

class String
  
  @@colors_map = {
    "red" => "31",
    "green" => "32",
    "yellow" => "33",
    "blue" => "34",
    "pink" => "35",
    "light_blue" => "94",
    "white" => "97",
    "light_grey" => "37",
    "black" => "30"
  }

  def self.create_colors
    @@colors_map.each do |k,v|
      self.send( :define_method, k ) do
        "\e[" + v + "m" + self + "\e[0m" 
      end
    end
  end
  
  def self.colors
    puts "Colors :"
    @@colors_map.each do |k,v|
      puts k
    end
    
    return
  end
  
end

String.create_colors
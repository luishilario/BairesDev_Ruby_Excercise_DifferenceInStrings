class TemperatureConverter
    FAHRENHEIT_CONSTANT = 32
    FAHRENHEIT_CONVERSION_CONSTANT = 9/5.0
    CELSIUIS_CONVERSION_CONSTANT = 5.0/9
    
    def self.celsius_to_fahrenheit celsius
        fahrenheit = celsius * FAHRENHEIT_CONVERSION_CONSTANT
        fahrenheit += FAHRENHEIT_CONSTANT
        
    end

    def self.fahrenheit_to_celsius fahrenheit
        celsius = fahrenheit - FAHRENHEIT_CONSTANT
        celsius *= CELSIUIS_CONVERSION_CONSTANT 
    end
end

puts "Fahrenheit: #{TemperatureConverter.celsius_to_fahrenheit 40}"
puts "Celsius: #{TemperatureConverter.fahrenheit_to_celsius 0}"
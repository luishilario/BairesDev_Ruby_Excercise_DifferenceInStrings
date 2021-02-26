# BairesDev_Ruby_Excercise_DifferenceInStrings

Statement
Create a method that, given two strings A and B, it returns the amount of modifications (adding, removing or replacing a character) required to turn A into B. If A and B are equals, 
the method should return 0. It should be used as:
"bananas".distance_to("ananas") # => 1
"parrot".distance_to("parrot") # => 0
"parrot".distance_to("torrap") # => 4
If any String B is nil, it should throw an error message, informing the user that the method cannot compare to NilClass. 
This method also accepts receiving a block of code as a parameter in order to override the default distance calculation algorithm for another one the user prefers:
"bananas".distance_to("ananas") do |other|
     other.length
end # => 6
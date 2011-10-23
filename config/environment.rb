# Load the rails application
require File.expand_path('../application', __FILE__)
require File.expand_path('../navigation.rb', __FILE__)

# Initialize the rails application
PokrovvetRu::Application.initialize!
Encoding.default_external = Encoding::UTF_8

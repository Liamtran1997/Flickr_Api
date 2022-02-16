# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


require 'rubygems'
require 'flickr'
MY_KEY='7306ff96e743f4edcfdc766175400d93'
class Flickr
  alias old_initialize initialize
  def initialize(api_key=MY_KEY, email=nil)
    puts "new_initialize " + MY_KEY
    old_initialize(api_key, email)
    @host="http://api.flickr.com"
    @activity_file='flickr_activity_cache.xml'
  end
end

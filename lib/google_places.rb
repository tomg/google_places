# Google Places
require 'rubygems'
gem 'httparty'
require 'httparty'
require 'hashie'
require 'base64'
require 'hmac-sha1'

directory = File.expand_path(File.dirname(__FILE__))

Hash.send :include, Hashie::HashExtensions

module GooglePlaces
  
  # create config/initializers/google_places.rb
  # 
  # GooglePlaces.configure do |config|
  #   config.api_key = 'api_key'
  #   config.client_id = 'client_id'
  # end
  # client = GooglePlaces::Client.new
  #
  # or
  #
  # GooglePlaces.api_key = 'api_key'
  # GooglePlaces.client_id = 'client_id'
  #
  # or
  #
  # GooglePlaces::Client.new(:api_key => 'api_key', :client_id => 'client_id')
  
  def self.configure
    yield self
    true
  end

  class << self
    attr_accessor :api_key, :client_id
  end
  
end

require File.join(directory, 'google_places', 'client')

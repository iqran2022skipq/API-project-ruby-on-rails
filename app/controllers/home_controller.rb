class HomeController < ApplicationController
  def index
    # require 'net/http'
    require 'net/https'
    require 'json'

    @url='https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=20002&distance=25&API_KEY=3924C171-6B55-41B6-9AF6-068C9B09AC38'

    @uri =URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
    
    if @output.empty?
      @result="There some Error"
    else 
      @result = @output[0]['AQI']
    end
  end
end

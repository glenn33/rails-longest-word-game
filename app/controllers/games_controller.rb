require 'open-uri'

class GamesController < ApplicationController
  
  def new
    @letters = Array.new(10) { ('a'..'z').to_a.sample }
	end

  def score
    raise
    word = params[:word]
    grid = params[:grid]
    @result = ''
    if !word.chars.all?{ |letter| grid.include?(letter) }
      @result = "Sorry but TEST can\'t be built out of #{grid}"
    elsif dictionary(@word)["found"]
      @result = "Congratulation! is a valid English Word!"
    else
      @result = "Sorry but it does not seem to be a valid English word.."
    end

  end
end

def dictionary(word)
  url = "https://wagon-dictionary.herokuapp.com/#{word}"
  api_response = open(url).read
  data = JSON.parse(api_response)
  return data
end

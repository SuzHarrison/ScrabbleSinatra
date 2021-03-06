require 'sinatra'
require_relative 'lib/scoring.rb'

class ScrabbleSinatra < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/index' do
    erb :index
  end

  get '/score' do
    erb :score
  end

  post '/score' do
    @word_score = Scoring.score(params["word"])
    @word = params["word"]
    @letter_scores = Scoring.letter_by_letter(params["word"])
    erb :score
  end

  get '/score-many' do
    erb :score_many
  end

  post '/score-many' do
      @words_scores = Scoring.score_many(params["word"])
      @word = params["word"]
      erb :score_many
  end

  run!
end

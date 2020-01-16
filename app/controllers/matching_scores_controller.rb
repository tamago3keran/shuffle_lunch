class MatchingScoresController < ApplicationController
  def index
    @matching_scores = MatchingScore.all
  end
end
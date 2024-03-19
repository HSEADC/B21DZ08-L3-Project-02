class WelcomeController < ApplicationController
  before_action :authenticate_user!, only: :profile
  
  def index
    @subscription = Subscription.new
  end

  def about
  end

  def feed
    @plants = Plant.all
    @ideas = Idea.all
    @shelves = Shelf.all

  end

  def exchange
    @swaps = Swap.all
  end

  def myswaps
    @swaps = Swap.all
  end

  def main
    @plants = Plant.all
    @ideas = Idea.all
  end

  def savedIdeas
    @savedIdeas = current_user.savedIdeas
  end
end

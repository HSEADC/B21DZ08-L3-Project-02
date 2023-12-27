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
  end

  def exchange
    @swaps = Swap.all
  end

  def myswaps
    @swaps = Swap.all
  end
end

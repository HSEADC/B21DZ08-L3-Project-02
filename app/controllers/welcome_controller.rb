class WelcomeController < ApplicationController
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

  def profile
    @profile = current_user.profile
  end
end

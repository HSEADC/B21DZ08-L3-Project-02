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
end

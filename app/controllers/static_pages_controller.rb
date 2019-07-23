class StaticPagesController < ApplicationController
  def home
    @past = Event.past
    @future = Event.future
  end

  def about
  end
end

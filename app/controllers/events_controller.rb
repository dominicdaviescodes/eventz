class EventsController < ApplicationController

  def index
  
    @events = ["Bug Smash", "Hackathon", "Kata Camp", "Rails User Group"]
  end
end

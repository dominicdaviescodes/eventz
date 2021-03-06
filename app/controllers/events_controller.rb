class EventsController < ApplicationController

  def index
    # @events = Event.all
    # chained the SQL query in console and copied into index action.
    # @events = Event.where("starts_at > ?", Time.now).order("starts_at")
    # the query should be in the model, the method should then call it.
    @events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])

  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      # flash[:notice] = "Event successfully updated!"
      redirect_to @event, notice: "Event successfully updated!"
    else
      render :edit
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: "Event successfully created!"
    else 
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url
  end

  private

  def event_params
    params.require(:event).
      permit(:name, :description, :location, :price, :starts_at,
             :capacity, :image_file_name)
  end
end

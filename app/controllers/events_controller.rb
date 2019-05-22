class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(ticket_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to new, notice: 'Event was successfully created.' }
        format.json { render :json }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def ticket_params
    params.require(:event).permit(:description, :name, :start_date, :place_id)
  end
end

class EventsController < ApplicationController

  def index
    @events = Event.search(params).result.paginate(page: page, per_page: 10)
    render json: @events,
      meta: {
        total: @events.total_entries,
        page: @events.current_page,
        per_page: @events.per_page
      }
  end

  def create
    render json: Event.create(params[:event])
  end

  def update
    render json: Event.update(params[:id], params[:event])
  end

  def destroy
    render json: Event.destroy(params[:id])
  end

  private

  def page
    (params[:page] || 1).to_i
  end

end

module Enumerable
  def random_element
    self[Random.rand(length)]
  end
end

class CalendarDaysController < ApplicationController
  before_action :set_calendar_day, only: [:show, :edit, :update, :destroy]

  # GET /calendar_days
  # GET /calendar_days.json
  def index
    load_data
  end

  def open
    set_calendar_day
    if @calendar_day.starts <= Time.zone.today
      @calendar_day.update(opened: true)
    else
      flash[:notice] = not_allowed_message
    end
    load_data
    render :index
  end

  def reset
    CalendarDay.update_all(opened: false)
    load_data
    render :index
  end

  # GET /calendar_days/new
  def new
    @calendar_day = CalendarDay.new
  end


  private

    def not_allowed_message
      [
        "Quit it, cheater!"
      ].random_element
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_calendar_day
      @calendar_day = CalendarDay.find(params[:id])
    end

    def set_countdown
      @countdown = DateTime.new(2015, 1, 8, 20, 0, 0, '-8') - DateTime.now
    end

    def load_days
      @calendar_days = CalendarDay.all
    end

    def load_data
      load_days
      set_countdown
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_day_params
      params.require(:calendar_day).permit(:starts, :description, :image_path, :opened)
    end
end

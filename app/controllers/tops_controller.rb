class TopsController < ApplicationController
  before_action :set_q, only: [:index]

  def index
    @rooms = @q.result(distinct: true)
  end

  def search
    @results = @q.result
  end

  private
  
  def set_q
    @q = Room.ransack(params[:q])
  end

end

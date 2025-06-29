class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_q, only: [:index, :search, :show]
  
  def search
    @results = @q.result
  end

  def index
    @rooms = Room.all
    @rooms = @q.result(distinct: true)
  end

  def own
    @rooms = Room.where(current_user_id: current_user.id)
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "ホテルを新規登録しました"
      redirect_to rooms_own_path
    else
      flash.now[:alert] = "ホテルを登録できませんでした"
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "ホテルの編集を完了しました"
      redirect_to rooms_own_path
    else
      flash.now[:alert] = "ホテルの編集ができませんでした"
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "ホテルを削除しました"
    redirect_to rooms_own_path
  end

  private

  def set_q
    @q = Room.ransack(params[:q])
  end

  def room_params
    params.require(:room).permit(:name, :image, :introduction, :charge, :address, :current_user_id)
  end

end


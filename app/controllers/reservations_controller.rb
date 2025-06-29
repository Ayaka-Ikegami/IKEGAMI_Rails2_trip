class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def confirm ##施設詳細/room/showから予約→予約確認ページ/reservation/confirmに進むときの処理
    @reservation = Reservation.new(reservation_params)
    @user_id = current_user.id
    @room = Room.find(params[:room_id])

    unless @reservation.check_in_day.nil? || @reservation.check_out_day.nil? || @reservation.people.nil?
      @total_nights = (@reservation.check_out_day - @reservation.check_in_day).to_i
      @total_days = (@reservation.check_out_day - @reservation.check_in_day + 1).to_i
      @total_charge = (@room.charge) * (@total_days) * (@reservation.people)
    else
      flash.now[:alert] = "必須項目はすべて入力してください"
      render "rooms/show"
      return
    end

    if (@reservation.check_out_day - @reservation.check_in_day).to_i <= 0
      flash.now[:alert] = "チェックインはチェックアウトより前の日付を選択してください"       
      render "rooms/show"
    elsif @reservation.people <= 0
      flash.now[:alert] = "正しい人数を入力してください"
      render "rooms/show"
    end
  end

  def create ##予約確認ページconfirmから予約完了（保存）までの処理
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in_day, :check_out_day, :people, :user_id, :room_id, :total_nights, :total_days, :total_charge))
    @reservation.user_id = current_user.id
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to action: 'index'
    else
      flash.now[:alert] = "予約ができませんでした"
      render "rooms/show"
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約を削除しました"
    redirect_to reservations_path ##予約一覧indexページにリンク
  end

  private
  def reservation_params
    params.require(:reservation).permit(:check_in_day, :check_out_day, :people, :user_id, :room_id)
  end

end

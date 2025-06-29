class Reservation < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :room, optional: true

  with_options presence: true do
    validates :check_in_day
    validates :check_out_day
    validates :people
  end

  validates :people, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validate :check_out_check
  def check_out_check
    if check_in_day.present? && check_in_day >= check_out_day
        errors.add("チェックアウトはチェックイン以降の日付を選択してください")
    end
  end

end
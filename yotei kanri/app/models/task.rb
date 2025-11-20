class Task < ApplicationRecord
    validates :title, presence: true, length: { maximum: 20 }
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :memo, length: { maximum: 500 }

    validate :end_date_after_start_date   # 👈 カスタムバリデーション呼び出し

    private

    # カスタムバリデーションの定義
     def end_date_after_start_date
    # どちらかが未入力の場合は、ここではチェックをスキップ
    return if start_date.blank? || end_date.blank?

    if end_date < start_date
      errors.add(:end_date, "は開始日以降の日付を選択してください")
    end
  end

end

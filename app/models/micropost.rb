class Micropost < ApplicationRecord
  belongs_to :user
  
  default_scope { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :diary, length: { maximum: 255 }
  validates :only_user_id, presence: true

  private
    def only_user_id
      time.presence or memo.presence or picture.attached?
    end

end

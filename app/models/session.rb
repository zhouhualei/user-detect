class Session < ActiveRecord::SessionStore::Session
  belongs_to :user
  before_save :ensure_user_is_set

  scope :of_members, -> { where("user_id is not null") }
  scope :of_guests, -> { where("user_id is null") }

  def self.find_by_session_id(session_id)
    find(:first, :conditions => ["session_id = ?", session_id])
  end

  private
    def ensure_user_is_set
      warden_data = self.data["warden.user.user.key"]
      if warden_data
        user_id = warden_data[0][0]
        self.user = User.find(user_id)
      end
    end

end
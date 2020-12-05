class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i[create update]
  validates :full_name, :email, :nickname, :birth_date, presence: :true
  validates :email, :nickname, uniqueness: { case_sensitive: false }
  validate :minimum_age

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: "150x150!").processed
    else
      "default_profile.png"
    end
  end

  private
  def minimum_age
    if birth_date.present? && birth_date > 16.years.ago.to_date
      errors.add(:birth_date, 'You should be over 16 years old.')
    end
  end
  def add_default_avatar
    unless avatar.attached?
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_profile.png'
          )
        ),
        filename: 'default_profile.png',
        content_type: 'image/jpg'
      )
    end
  end
end

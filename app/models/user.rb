class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :login

  validates :username, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\A[a-zA-Z0-9 _\.]*\z/}


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where("lower(username) = :value OR lower(email) = :value", value: login.downcase).first
    else
      where(conditions.to_hash).first
    end
  end

  def self.from_omniauth(auth)
    where(google_id: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.name
      user.password =  Devise.friendly_token[0,20]
      # user.skip_confirmation!

      # data = access_token.info
      # user = User.where(email: data['email']).first

      # Uncomment the section below if you want users to be created if they don't exist
      # unless user
      #   user = User.create(name: data['name'],
      #       email: data['email'],
      #       password: Devise.friendly_token[0,20]
      #     )
      #   end
      # user
    end
  end
end

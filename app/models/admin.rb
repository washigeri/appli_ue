class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :recoverable,
  before_save :set_allow
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable

  private
  def set_allow
    emailsplit = email.split(/@/)
    if emailsplit.last == "ensiie.fr"
      if emailsplit.first == "malek.elouerghi" or emailsplit.first == "stephane.genaud" or emailsplit.first == "nicolas.brunel"
        self.allowed = true
      end
    end
  end
end

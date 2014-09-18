class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :sales, dependent: :destroy
  
  def add_coin(amount)
    update_attribute(:coin, self.coin+amount)
  end
end

class Usuario < ActiveRecord::Base
	before_save { self.email = email.downcase }

	validates :nombre, presence: true, length: {maximum: 50}
	validates :email, presence: true, length: {maximum: 100},
	format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
	uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: {minimum: 4}

	def Usuario.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
  	end
end

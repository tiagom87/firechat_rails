class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	after_create :populate_guid_and_token

         private
  
  def populate_guid_and_token
  	random = SecureRandom.uuid()
  	arbitraryAuthPayload = {:auth_data => random, :other_auth_data => self.created_at.to_s}
  	generator = Firebase::FirebaseTokenGenerator.new("7aSOGspMf6uTD7bXJs1KmnNu1FwH1VdLetZIu6u8")
  	random2 = generator.create_token(arbitraryAuthPayload)
  	self.guid = random
  	self.chat_token = random2
  	self.save
  end
end

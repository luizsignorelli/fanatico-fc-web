class User < Ohm::Model
  attribute :facebook_id
  attribute :team
  index :facebook_id

  def self.find_or_create_by_facebook_id(id)
    user = User.find(:facebook_id => id).first
    if user.nil?
      user = User.create :facebook_id => id
    end
    user
  end
end
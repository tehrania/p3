class User < ActiveRecord::Base
  include BCrypt

 validates :name, :presence => true, 
                       :uniqueness => true
  validates :email,    :presence => true,
                       :uniqueness => true
  validates :password, :presence => true


  def password 
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password ||= Password.create(pass)
    self.password_hash = @password
  end

  #remember how we redefined User.create before? That gets a modification as well:

  def self.create(params)
    user = User.new( 
    email: params[:user][:email],
    name: params[:user][:name])
    user.password = params[:user][:password]
    user.save
    user
  end  

  
end


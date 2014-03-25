class User < ActiveRecord::Base
  attr_accessor :password
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nom, :presence => true, :length => { :maximum => 30 }
  validates :nom, :presence => true, :length => { :maximum => 30 }
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
  # Crée automatique l'attribut virtuel 'password_confirmation'.
  validates :password, :presence => true, :confirmation => true, :length => { :within => 6..40 }, on: :create
  has_many :rdvs, inverse_of: :user

  before_save :encrypt_password

  def has_password?(password_soumis)
    encrypted_password == encrypt(password_soumis)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def parsed_fields
    self.fields.nil? ? [] : JSON.parse(self.fields)
  end

private

  def encrypt_password
  	self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end

   def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end

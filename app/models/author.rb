class Author < ActiveRecord::Base
    has_secure_password

    has_many :journals

    validates :username, :name, presence: true
    # password is required with the bcrypt gem as well
    validates :username, uniqueness: true

end
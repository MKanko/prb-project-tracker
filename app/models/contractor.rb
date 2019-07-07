class Contractor < ActiveRecord::Base
    has_secure_password
    has_many :projects
    has_many :sub_contractors, through: :projects 
end 
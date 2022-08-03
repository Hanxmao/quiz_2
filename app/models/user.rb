class User < ApplicationRecord
    has_secure_password
    has_many :ideas, dependent: :nullify
    has_many :reviews, dependent: :nullify

    def full_name
        self.first_name + ' ' + self.last_name
    end

end

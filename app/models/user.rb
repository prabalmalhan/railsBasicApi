class User < ApplicationRecord
    has_many :video
    has_many :comments
end

# 1) rails g scaffold user email:string


# 2) rails g scaffold videos ...... user:refrences
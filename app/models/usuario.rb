class Usuario < ApplicationRecord
    # Asociación entre modelos. Un usuario tiene varios post.
    has_many :posts
end

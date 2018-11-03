class Post < ApplicationRecord
  # Asociación entre modelos. Un post tiene un usuario.
  belongs_to :usuario
end

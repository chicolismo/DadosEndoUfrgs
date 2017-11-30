
class User < ApplicationRecord
  self.table_name = 'usuario'
  self.primary_key = 'id_usuario'

  alias_attribute :id, :id_usuario
  alias_attribute :password, :senha
  alias_attribute :name, :nome

end

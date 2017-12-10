
class Usuario < ApplicationRecord
  self.table_name = 'usuario'
  self.primary_key = 'id_usuario'

  alias_attribute :id, :id_usuario

  #
  # Um mesmo usuário pode cadastrar diversas coisas
  #
  has_many :anamneses, :foreign_key => 'id_usuario', :class_name => 'Anamnese'
  has_many :avaliacoes, :foreign_key => 'id_usuario', :class_name => 'Avaliacao'
  has_many :tratamentos, :foreign_key => 'id_usuario', :class_name => 'Tratamento'
  has_many :controles, :foreign_key => 'id_usuario', :class_name => 'Controle'

end

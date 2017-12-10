class SemiologiaAuxiliar < ApplicationRecord
  self.table_name = 'semioaux'
  self.primary_key = 'id_semioAux'

  alias_attribute :id, :id_semioAux

  belongs_to :avaliacao, :foreign_key => 'id_prontuario_avaliacao', :class_name => 'Avaliacao'
end

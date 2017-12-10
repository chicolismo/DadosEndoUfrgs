class ExameRaioX < ApplicationRecord
  self.table_name = 'examerx'
  self.primary_key = 'id_examerx'

  has_many :curvaturas_raizes, :foreign_key => 'id_examerx', :class_name => 'CurvaturaRaizes'

  belongs_to :Avaliacao, :foreign_key => 'id_prontuario_avaliacao', :class_name => 'Avaliacao'
end

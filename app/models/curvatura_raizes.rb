class CurvaturaRaizes < ApplicationRecord
  self.table_name = 'curvatura_raizes'
  self.primary_key = 'id_curvatura_raizes'

  belongs_to :exame_raio_x, :foreign_key => 'id_examerx', :class_name => 'ExameRaioX'
end

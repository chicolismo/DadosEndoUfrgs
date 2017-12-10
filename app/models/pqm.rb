# Preparo Químico-Mecânico
class PQM < ApplicationRecord
  self.table_name = 'pqm'
  self.primary_key = 'id_pqm'

  alias_attribute :id, :id_pqm

  belongs_to :tratamento, :foreign_key => 'id_prontuario_tratamento', :class => 'Tratamento'
end

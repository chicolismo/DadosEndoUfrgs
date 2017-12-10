class Odontometria < ApplicationRecord
  self.table_name = 'odontometria'
  self.primary_key = 'id_odo'

  alias_attribute :id, :id_odo

  belongs_to :tratamento, :foreign_key => 'id_prontuario_tratamento', :class => 'Tratamento'
end

class PreparoTercoCervical < ApplicationRecord
  self.table_name = 'prep_terco_cervical'
  self.primary_key = 'id_prep'

  alias_attribute :id, :id_prep

  belongs_to :tratamento, :foreign_key => 'id_prontuario_tratamento', :class_name => 'Tratamento'
end

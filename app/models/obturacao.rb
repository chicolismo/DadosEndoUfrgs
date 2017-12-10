class Obturacao < ApplicationRecord
  self.table_name = 'obturacao'
  self.primary_key = 'id_obt'

  alias_attribute :id, :id_obt

  belongs_to :tratamento, :foreign_key => 'id_prontuario_tratamento', :class_name => 'Tratamento'
end

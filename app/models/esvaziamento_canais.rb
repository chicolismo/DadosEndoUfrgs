class EsvaziamentoCanais < ApplicationRecord
  self.table_name = 'esvaziamento_canais'
  self.primary_key = 'id_ezv'  # Não deveria ser id_evz?

  alias_attribute :id, :id_ezv

  belongs_to :tratamento, :foreign_key => 'id_prontuario_tratamento', :class_name => 'Tratamento'
end

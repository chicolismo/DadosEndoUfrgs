class Controle < ApplicationRecord
  self.table_name = 'controle'
  self.primary_key = 'id_prontuario_controle'

  # TODO: Terminar de melhorar os campos
  alias_attribute :id, :id_prontuario_controle

  belongs_to :usuario, :foreign_key => 'id_usuario', :class_name => 'Usuario'
  belongs_to :paciente, :foreign_key => 'id_paciente', :class_name => 'Paciente'
end

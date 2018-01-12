class SemioAuxiliar < ApplicationRecord
  self.table_name = 'semioaux'
  self.primary_key = 'id_semioAux'

  alias_attribute :id, :id_semioAux

  belongs_to :avaliacao, :foreign_key => 'id_prontuario_avaliacao', :class_name => 'Avaliacao'

  alias_attribute :id, :id_semioAux
  alias_attribute :avaliacao_id, :id_prontuario_avaliacao
  alias_attribute :dente, :ava_semioAux_dente
  alias_attribute :percussao_vertical, :ava_semioAux_percVertical
  alias_attribute :percussao_horizontal, :ava_semioAux_percHorizontal
  alias_attribute :som_metalico_percussao, :ava_semioAux_somMetalPerc
  alias_attribute :pressao_apical, :ava_semioAux_pressaoApical
  alias_attribute :sensibilidade_frio, :ava_semioAux_sensivelFrio
  alias_attribute :teste_cavidade, :ava_semioAux_testeCavidade
  alias_attribute :teste_anestesia, :ava_semioAux_testeAnestesio
  alias_attribute :calor, :ava_semioAux_calor
end

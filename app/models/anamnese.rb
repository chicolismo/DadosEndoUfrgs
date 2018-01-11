class Anamnese < ApplicationRecord
  self.table_name = 'anamnese'
  self.primary_key = 'id_prontuario_anamnese'

  # TODO: Terminar de traduzir os campos

  alias_attribute :id, :id_prontuario_anamnese
  alias_attribute :usuario_id, :id_usuario
  alias_attribute :paciente_id, :id_paciente
  alias_attribute :data, :data_anamnese
  alias_attribute :tratamento_medico, :anm_estaTtoMedico
  alias_attribute :tratamento_medico_motivo, :anm_motivoTto
  alias_attribute :usa_medicamentos, :anm_usaMedicamentos
  alias_attribute :lista_de_medicamentos, :anm_listMedicamentos
  alias_attribute :procedimento_cirurgia, :anm_procedimentoCirurgia
  alias_attribute :qual_procedimento_cirurgia, :anm_qualProcCirurgia
  alias_attribute :pa, :anm_PA
  alias_attribute :valor_pa, :anm_valorPA
  alias_attribute :febre_reumatica, :anm_febreReumatica
  alias_attribute :cardiovascular, :anm_cardiovascular
  alias_attribute :cardiovasculopatias, :anm_cardiovasculopatias
  alias_attribute :asma, :anm_asma
  alias_attribute :dificuldade_de_respiracao, :anm_difRespiracao
  alias_attribute :hepatopatias, :anm_hepatopatias
  alias_attribute :dm, :anm_DM
  alias_attribute :artrite, :anm_artrite
  alias_attribute :bisfosfonado, :anm_bisfosfonado
  alias_attribute :gastro, :anm_gastro
  alias_attribute :nefro, :anm_nefro
  alias_attribute :soro_hiv, :anm_soroHIV
  alias_attribute :onco, :anm_onco
  alias_attribute :onco_tipo, :anm_oncoTipo
  alias_attribute :hemofilia, :anm_hemofilia
  alias_attribute :gestante, :anm_gestante
  alias_attribute :anemia, :anm_anemia
  alias_attribute :drogas, :anm_usoDrogas
  alias_attribute :drogas_tipo, :anm_usoDrogasTipo
  alias_attribute :drogas_frequencia, :anm_usoDrogasFreq
  alias_attribute :alcool, :anm_usoAlcool
  alias_attribute :alcool_frequencia, :anm_usoAlcoolFreq
  alias_attribute :tabaco, :anm_usoTabaco
  alias_attribute :tabaco_tipo, :anm_usoTabacoTipo
  alias_attribute :tabaco_frequencia, :anm_usoTabacoFreq
  alias_attribute :alergia_med, :anm_alergiaMed
  alias_attribute :alergia_med_tipo, :anm_alergiaTipoMed
  alias_attribute :peso, :anm_peso
  alias_attribute :peso2, :anm_peso_2
  alias_attribute :altura, :anm_altura
  alias_attribute :altura2, :anm_altura_2
  alias_attribute :queixa_pricipal, :anm_queixaPrincipal

  # Cada anamnese pertence a um paciente
  belongs_to :paciente, :foreign_key => 'id_paciente', :class_name => 'Paciente'

  # Cada anamnese foi cadastrada por um usuário
  belongs_to :usuario, :foreign_key => 'id_usuario', :class_name => 'Usuario'

  def cardiovasculopatias_list
    if self.cardiovasculopatias.nil? 
      ''
    else
      self.cardiovasculopatias.split('*').select { |string| string.size > 0 }
    end
  end

  def cardiovasculopatias_list=(list)
    self.cardiovasculopatias = list.join('*')
  end

  def hepatopatias_list
    if hepatopatias.nil?
      ''
    else
      hepatopatias.split('*').select { |string| string.size > 0 }
    end
  end

  def hepatopatias_list=(list)
    hepatopatias = list.join('*')
  end
end

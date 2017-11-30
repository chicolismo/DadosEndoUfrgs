class Anamnesis < ApplicationRecord
  self.table_name = 'anamnese'
  self.primary_key = 'id_prontuario_anamnese'

  alias_attribute :id, :id_prontuario_anamnese
  alias_attribute :user_id, :id_usuario
  alias_attribute :pacient_id, :id_paciente
  alias_attribute :date, :date_anamnese

  alias_attribute :in_treatment?, :anm_estaTtoMedico
  alias_attribute :treatment_reason, :anm_motivoTto

  alias_attribute :on_medication?, :anm_usaMedicamentos
  alias_attribute :medication_list, :anm_listMedicamentos

  alias_attribute :surgical_procedure?, :anm_procedimentoCirurgia
  alias_attribute :surgical_procedure_type, :anm_qualProcCirurgia

  alias_attribute :pa?, :anm_PA
  alias_attribute :pa_value, :anm_valorPA

  alias_attribute :rheumatic_fever?, :anm_feebreReumatica
  alias_attribute :cardiovascular?, :anm_cardiovascular
  alias_attribute :asthma?, :anm_asma
  alias_attribute :difficulty_breathing?, :anm_difRespiracao
  alias_attribute :liver_diseases?, :anm_hepatopatias
  alias_attribute :dm?, :anm_DM
  alias_attribute :arthritis?, :anm_atrite
  alias_attribute :bisphosphonate?, :anm_bisfosfonado
  alias_attribute :gastro?, :anm_gastro
  alias_attribute :nephro?, :anm_nefro
  alias_attribute :hiv, :anm_soroHIV
  alias_attribute :onco?, :anm_onco
  alias_attribute :onco_type, :anm_oncoTipo
  alias_attribute :hemophilia?, :anm_hemofilia
  alias_attribute :pregnant?, :anm_gestante
  alias_attribute :anemy?, :anm_anemia
  alias_attribute :drug_usage?, :anm_usoDrogas
  alias_attribute :drug_usage_type, :anm_usoDrogasTipo
  alias_attribute :drug_usage_frequency, :anm_usoDrogasFreq
  alias_attribute :alcohol_usage?, :anm_usoAlcool
  alias_attribute :alcohol_usage_frequency, :anm_usoAlcoolFreq
  alias_attribute :tobacco_usage?, :anm_usoTabaco
  alias_attribute :tobacco_usage_frequency, :anm_usoTabacoFreq


end

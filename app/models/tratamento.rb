class Tratamento < ApplicationRecord
  self.table_name = 'tratamento'
  self.primary_key = 'id_prontuario_tratamento'

  alias_attribute :id, :id_prontuario_tratamento

  has_many :obturacoes, :foreign_key => 'id_prontuario_tratamento', :class_name => 'Obturacao'
  has_many :odontometries, :foreign_key => 'id_prontuario_tratamento', :class_name => 'Odontometria'
  has_many :pqms, :foreign_key => 'id_prontuario_tratamento', :class_name => 'PQM'
  has_many :esvaziamentos_canais, :foreign_key => 'id_prontuario_tratamento', :class_name => 'EsvaziamentoCanais'
  has_many :preparos_terco_cervical, :foreign_key => 'id_prontuario_tratamento', :class_name => 'PreparoTercoCervical'

  belongs_to :usuario, :foreign_key => 'id_usuario', :class_name => 'Usuario'
  belongs_to :paciente, :foreign_key => 'id_paciente', :class_name => 'Paciente'

  alias_attribute :data, :data_tratamento
  # alias_attribute :, :dente
  # alias_attribute :, :magnificacao
  # alias_attribute :, :anestesia
  # alias_attribute :, :tecnica_anestesica
  # alias_attribute :, :anestesico
  # alias_attribute :, :isolamento
  # alias_attribute :, :isolamento_absoluto
  # alias_attribute :, :acesso_canais
  # alias_attribute :, :odo_naocoletado
  # alias_attribute :, :ezv_naocoletado
  # alias_attribute :, :prep_naocoletado
  # alias_attribute :, :prep_auxquim_1
  # alias_attribute :, :prep_auxquim_2
  # alias_attribute :, :prep_auxquim_2obs
  # alias_attribute :, :prep_auxquim_3
  # alias_attribute :, :prep_auxquim_4
  # alias_attribute :, :prep_auxquim_4obs
  # alias_attribute :, :prep_auxquim_5
  # alias_attribute :, :prep_auxquim_5obs
  # alias_attribute :, :prep_auxquim_6
  # alias_attribute :, :prep_auxquim_7
  # alias_attribute :, :prep_auxquim_8
  # alias_attribute :, :prep_auxquim_9
  # alias_attribute :, :prep_auxquim_9obs
  # alias_attribute :, :pqm_naocoletado
  # alias_attribute :, :pqm_medint_1
  # alias_attribute :, :pqm_medint_2
  # alias_attribute :, :pqm_medint_3
  # alias_attribute :, :pqm_medint_4
  # alias_attribute :, :pqm_medint_4obs
  # alias_attribute :, :pqm_medint_5
  # alias_attribute :, :pqm_medint_6
  # alias_attribute :, :pqm_medint_7
  # alias_attribute :, :pqm_medint_8
  # alias_attribute :, :pqm_medint_9
  # alias_attribute :, :pqm_medint_10
  # alias_attribute :, :pqm_medint_11
  # alias_attribute :, :pqm_medint_12
  # alias_attribute :, :pqm_ind_coa
  # alias_attribute :, :pqm_ind_coaobs
  # alias_attribute :, :pqm_protcerv
  # alias_attribute :, :pqm_protcervobs
  # alias_attribute :, :obt_naocoletado
  # alias_attribute :, :pre_mednaocoletado
  # alias_attribute :, :pre_med1
  # alias_attribute :, :pre_med1obs
  # alias_attribute :, :pre_med2
  # alias_attribute :, :pre_med2obs
  # alias_attribute :, :pre_med3
  # alias_attribute :, :pre_med3obs
  # alias_attribute :, :pre_med4
  # alias_attribute :, :pre_med4obs
  # alias_attribute :, :interc_naocoletado
  # alias_attribute :, :interc_1
  # alias_attribute :, :interc_2
  # alias_attribute :, :interc_3
  # alias_attribute :, :tinterc_naocoletado
  # alias_attribute :, :tinterc_1
  # alias_attribute :, :tinterc_2
  # alias_attribute :, :tinterc_3
  # alias_attribute :, :tinterc_4
  # alias_attribute :, :tinterc_5
  # alias_attribute :, :tinterc_6
  # alias_attribute :, :tinterc_7
  # alias_attribute :, :tinterc_7obs
  # alias_attribute :, :tinterc_8
  # alias_attribute :, :tinterc_8obs
  # alias_attribute :, :minterc_naocoletado
  # alias_attribute :, :minterc_1
  # alias_attribute :, :minterc_2
  # alias_attribute :, :minterc_3
  # alias_attribute :, :minterc_4
  # alias_attribute :, :minterc_5
  # alias_attribute :, :minterc_6
  # alias_attribute :, :minterc_7
  # alias_attribute :, :minterc_8
  # alias_attribute :, :minterc_9
  # alias_attribute :, :minterc_10
  # alias_attribute :, :minterc_11
  # alias_attribute :, :minterc_12
  # alias_attribute :, :minterc_13
  # alias_attribute :, :minterc_13obs
  # alias_attribute :, :minterc_obs
  # alias_attribute :, :acidentes_naocoletado
  # alias_attribute :, :acidentes_1
  # alias_attribute :, :acidentes_2
  # alias_attribute :, :acidentes_3
  # alias_attribute :, :tacidentes_naocoletado
  # alias_attribute :, :tacidentes_1
  # alias_attribute :, :tacidentes_1obs
  # alias_attribute :, :tacidentes_1obs2
  # alias_attribute :, :tacidentes_2
  # alias_attribute :, :tacidentes_3
  # alias_attribute :, :tacidentes_4
  # alias_attribute :, :tacidentes_5
  # alias_attribute :, :tacidentes_6
  # alias_attribute :, :tacidentes_7
  # alias_attribute :, :tacidentes_8
  # alias_attribute :, :tacidentes_9
  # alias_attribute :, :tacidentes_ext
  # alias_attribute :, :tacidentes_10
  # alias_attribute :, :tacidentes_11
  # alias_attribute :, :tacidentes_12
  # alias_attribute :, :tacidentes_13
  # alias_attribute :, :tacidentes_14
  # alias_attribute :, :tacidentes_tinst
  # alias_attribute :, :tacidentes_15
  # alias_attribute :, :tacidentes_16
  # alias_attribute :, :tacidentes_17
  # alias_attribute :, :tacidentes_18
  # alias_attribute :, :tacidentes_19
  # alias_attribute :, :tacidentes_20
  # alias_attribute :, :tacidentes_21
  # alias_attribute :, :tacidentes_22
  # alias_attribute :, :tacidentes_22obs
  # alias_attribute :, :macidentes_naocoletado
  # alias_attribute :, :macidentes_1
  # alias_attribute :, :macidentes_2
  # alias_attribute :, :macidentes_3
  # alias_attribute :, :macidentes_4
  # alias_attribute :, :macidentes_5
  # alias_attribute :, :macidentes_6
  # alias_attribute :, :macidentes_7
  # alias_attribute :, :macidentes_7obs
  # alias_attribute :, :macidentes_8
  # alias_attribute :, :macidentes_9
  # alias_attribute :, :macidentes_10
  # alias_attribute :, :macidentes_10obs
  # alias_attribute :, :macidentes_11
  # alias_attribute :, :macidentes_12
  # alias_attribute :, :macidentes_13
  # alias_attribute :, :macidentes_14
  # alias_attribute :, :macidentes_15
  # alias_attribute :, :macidentes_16
  # alias_attribute :, :macidentes_17
  # alias_attribute :, :macidentes_18
  # alias_attribute :, :macidentes_19
  # alias_attribute :, :macidentes_20
  # alias_attribute :, :macidentes_21
  # alias_attribute :, :macidentes_22
  # alias_attribute :, :macidentes_23
  # alias_attribute :, :macidentes_24
  # alias_attribute :, :macidentes_25
  # alias_attribute :, :macidentes_26
  # alias_attribute :, :macidentes_27
  # alias_attribute :, :macidentes_28
  # alias_attribute :, :macidentes_28obs
  # alias_attribute :, :macidentes_29
  # alias_attribute :, :macidentes_30
  # alias_attribute :, :macidentes_31
  # alias_attribute :, :macidentes_32
  # alias_attribute :, :macidentes_33
  # alias_attribute :, :macidentes_34
  # alias_attribute :, :macidentes_35
  # alias_attribute :, :macidentes_36
  # alias_attribute :, :macidentes_37
  # alias_attribute :, :macidentes_38
  # alias_attribute :, :macidentes_38obs
  # alias_attribute :, :macidentes_39
  # alias_attribute :, :macidentes_obs
end

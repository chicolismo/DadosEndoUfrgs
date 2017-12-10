class Avaliacao < ApplicationRecord
  self.table_name = 'avaliacao'
  self.primary_key = 'id_prontuario_avaliacao'

  alias_attribute :id, :id_prontuario_avaliacao

  # Cada avaliação pertence a um paciente e foi cadastrada por um usuário
  belongs_to :usuario, :foreign_key => 'id_usuario', :class_name => 'Usuario'
  belongs_to :paciente, :foreign_key => 'id_paciente', :class_name => 'Paciente'

  #----------------------------------------------------------------------------
  # Cada avaliação pode possuir:
  #
  # * Exames de raio-x
  # * Avaliações semiológicas auxiliares
  #----------------------------------------------------------------------------
  has_many :exames_raio_x, :foreign_key => 'id_prontuario_avaliacao', :class_name => 'ExameRaioX'
  has_many :semiologias_auxiliares, :foreign_key => 'id_prontuario_avaliacao', :class_name => 'SemiologiaAuxiliar'

  alias_attribute :data, :ava_data
  alias_attribute :responsavel_atendimento, :ava_resp_att
  alias_attribute :queixa_pricipal, :ava_queixa_principal
  alias_attribute :regiao_afetada, :ava_reg_afetada
  alias_attribute :sintomas, :ava_sintomas
  alias_attribute :escala_de_dor, :ava_escala_dor
  alias_attribute :sintomas_inicio, :ava_sintomas_inicio
  alias_attribute :sintomas_intensidade, :ava_sintomas_intensidade
  alias_attribute :sintomas_localizacao, :ava_sintomas_localizacao
  alias_attribute :sintomas_duracao, :ava_sintomas_duracao
  alias_attribute :sintomas_estimulo, :ava_sintomas_estimulo
  alias_attribute :sintomas_tipo, :ava_sintomas_tipo
  alias_attribute :sintomas_fatores_estimulantes, :ava_sintomas_fatEstimulantes
  alias_attribute :sintomas_fatores_atenuantes, :ava_sintomas_fatAtenuantes
  alias_attribute :sintomas_associados, :ava_sintomas_associados
  alias_attribute :hist_clinica_carie, :ava_histClinica_carie
  alias_attribute :hist_clinica_traumatismo, :ava_histClinica_traumatismo
  alias_attribute :hist_clinica_trauma_tipo, :ava_histClinica_tipoTrauma
  alias_attribute :hist_clinica_periodo_trauma, :ava_histClinica_periodoTrauma
  alias_attribute :hist_clinica_tratamentos_realizados, :ava_histClinica_ttoRealizados
  alias_attribute :hist_clinica_tratamentos_tipo, :ava_histClinica_tipoTto
  # alias_attribute :, :ava_extraOral_edema
  # alias_attribute :, :ava_extraOral_localEdema
  # alias_attribute :, :ava_extraOral_linfoAde
  # alias_attribute :, :ava_extraOral_localLinfoAde
  # alias_attribute :, :ava_extraOral_dorPalpa
  # alias_attribute :, :ava_extraOral_regiaoDor
  # alias_attribute :, :ava_extraOral_fistula
  # alias_attribute :, :ava_extraOral_localFistula
  # alias_attribute :, :ava_intraOral_rastreamento
  # alias_attribute :, :ava_intraOral_origemProcesso
  # alias_attribute :, :ava_extraOral_outrasObs
  # alias_attribute :, :ava_intraOral_coroa
  # alias_attribute :, :ava_intraOral_material
  # alias_attribute :, :ava_intraOral_adaptMarginal
  # alias_attribute :, :ava_intraOral_material2
  # alias_attribute :, :ava_intraOral_adaptMarginal2
  # alias_attribute :, :ava_intraOral_outras
  # alias_attribute :, :ava_intraOral_material3
  # alias_attribute :, :ava_intraOral_inclinacaoDente
  # alias_attribute :, :ava_intraOral_giroversao
  # alias_attribute :, :ava_intrOral_BolsaPerio
  # alias_attribute :, :ava_intraOral_faceBolsaPerio
  # alias_attribute :, :ava_intraOral_faceBolsaPerioVestibular
  # alias_attribute :, :ava_intraOral_faceBolsaPerioPalatina
  # alias_attribute :, :ava_intraOral_faceBolsaPerioLingual
  # alias_attribute :, :ava_intraOral_faceBolsaPerioMesial
  # alias_attribute :, :ava_intraOral_faceBolsaPerioDistal
  # alias_attribute :, :ava_intraOral_rastBolsaPerio
  # alias_attribute :, :ava_intraOral_localBolsaPerio
  # alias_attribute :, :ava_intraOral_NecrosePapilar
  # alias_attribute :, :ava_intraOral_eritemaGengival
  # alias_attribute :, :ava_IntraOral_InvEspacoBio
  # alias_attribute :, :ava_intraOral_RetracaoGengival
  # alias_attribute :, :ava_intraOral_hiperplasiaTec
  # alias_attribute :, :ava_radio_AltPeriapical
  # alias_attribute :, :ava_radio_IndicePeriapical
  # alias_attribute :, :ava_radio_detalhes
  # alias_attribute :, :ava_radio_detalhesTerco
  # alias_attribute :, :ava_radio_detalhes1
  # alias_attribute :, :ava_radio_detalhes2
  # alias_attribute :, :ava_radio_detalhes3
  # alias_attribute :, :ava_radio_detalhes4
  # alias_attribute :, :ava_perdaOsseaRegLateral
  # alias_attribute :, :ava_perdaOsseaRegLateralLocal
  # alias_attribute :, :ava_perdaOsseaPerio
  # alias_attribute :, :ava_tratamentoEndo
  # alias_attribute :, :ava_tratamentoEndoSatTempo
  # alias_attribute :, :ava_tratamentoEndoInsTempo
  # alias_attribute :, :ava_caractApar
  # alias_attribute :, :ava_caractApar1
  # alias_attribute :, :ava_caractApar2
  # alias_attribute :, :ava_caractApar3
  # alias_attribute :, :ava_caractApar4
  # alias_attribute :, :ava_caractApar5
  # alias_attribute :, :ava_caractApar6
  # alias_attribute :, :ava_caractAparCanaisNTrat
  # alias_attribute :, :ava_caractAparConesPrata
  # alias_attribute :, :ava_tomo
  # alias_attribute :, :ava_tomoDetalhes
  # alias_attribute :, :ava_diagnosticoPulpar
  # alias_attribute :, :ava_diagnosticoPeriapical
  # alias_attribute :, :ava_diagnosticoPeriodontal
  # alias_attribute :, :ava_diagnosticoOutros
  # alias_attribute :, :ava_diagnosticoObs
  # alias_attribute :, :ava_tratamento
  # alias_attribute :, :ava_tratamentoOutros
end

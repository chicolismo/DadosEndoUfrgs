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
  has_many :semio_auxiliares, :foreign_key => 'id_prontuario_avaliacao', :class_name => 'SemioAuxiliar', :inverse_of => :avaliacao, :dependent => :destroy
  has_many :exames_raio_x, :foreign_key => 'id_prontuario_avaliacao', :class_name => 'ExameRaioX', :inverse_of => :avaliacao, :dependent => :destroy

  accepts_nested_attributes_for :semio_auxiliares, :reject_if => lambda { |semio| semio[:dente].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :exames_raio_x

  alias_attribute :paciente_id, :id_paciente
  alias_attribute :usuario_id, :id_usuario

  alias_attribute :data, :ava_data
  alias_attribute :responsavel_atendimento, :ava_resp_att
  alias_attribute :queixa_principal, :ava_queixa_principal
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
  alias_attribute :extra_oral_edema, :ava_extraOral_edema
  alias_attribute :extra_oral_local_edema, :ava_extraOral_localEdema
  alias_attribute :extra_oral_linfo_ade, :ava_extraOral_linfoAde
  alias_attribute :extra_oral_local_linfo_ade, :ava_extraOral_localLinfoAde
  alias_attribute :extra_oral_dor_palpa, :ava_extraOral_dorPalpa
  alias_attribute :extra_oral_regiao_dor, :ava_extraOral_regiaoDor
  alias_attribute :extra_oral_fistula, :ava_extraOral_fistula
  alias_attribute :extra_oral_local_fistula, :ava_extraOral_localFistula
  alias_attribute :intra_oral_rastreamento, :ava_intraOral_rastreamento
  alias_attribute :intra_oral_origem_processo, :ava_intraOral_origemProcesso
  alias_attribute :extra_oral_outras_obs, :ava_extraOral_outrasObs

  alias_attribute :intra_oral_coroa, :ava_intraOral_coroa
  alias_attribute :intra_oral_material, :ava_intraOral_material
  alias_attribute :intra_oral_adapt_marginal, :ava_intraOral_adaptMarginal
  alias_attribute :intra_oral_material2, :ava_intraOral_material2
  alias_attribute :intra_oral_adapt_marginal2, :ava_intraOral_adaptMarginal2
  alias_attribute :intra_oral_outras, :ava_intraOral_outras
  alias_attribute :intra_oral_material3, :ava_intraOral_material3
  alias_attribute :intra_oral_inclinacao_dente, :ava_intraOral_inclinacaoDente
  alias_attribute :intra_oral_giroversao, :ava_intraOral_giroversao
  alias_attribute :intra_oral_bolsa_perio, :ava_intrOral_BolsaPerio
  alias_attribute :intra_oral_face_bolsa_perio, :ava_intraOral_faceBolsaPerio
  alias_attribute :intra_oral_face_bolsa_perio_vestibular, :ava_intraOral_faceBolsaPerioVestibular
  alias_attribute :intra_oral_face_bolsa_perio_palatina, :ava_intraOral_faceBolsaPerioPalatina
  alias_attribute :intra_oral_face_bolsa_perio_lingual, :ava_intraOral_faceBolsaPerioLingual
  alias_attribute :intra_oral_face_bolsa_perio_mesial, :ava_intraOral_faceBolsaPerioMesial
  alias_attribute :intra_oral_face_bolsa_perio_distal, :ava_intraOral_faceBolsaPerioDistal
  alias_attribute :intra_oral_rast_bolsa_perio, :ava_intraOral_rastBolsaPerio
  alias_attribute :intra_oral_local_bolsa_perio, :ava_intraOral_localBolsaPerio
  alias_attribute :intra_oral_necrose_papilar, :ava_intraOral_NecrosePapilar
  alias_attribute :intra_oral_eritema_gengival, :ava_intraOral_eritemaGengival
  alias_attribute :intra_oral_inv_espaco_bio, :ava_IntraOral_InvEspacoBio
  alias_attribute :intra_oral_retracao_gengival, :ava_intraOral_RetracaoGengival
  alias_attribute :intra_oral_hiperplasia_tec, :ava_intraOral_hiperplasiaTec
  alias_attribute :radio_alt_periapical, :ava_radio_AltPeriapical
  alias_attribute :radio_indice_periapical, :ava_radio_IndicePeriapical
  alias_attribute :radio_detalhes, :ava_radio_detalhes
  alias_attribute :radio_detalhes_terco, :ava_radio_detalhesTerco
  alias_attribute :radio_detalhes1, :ava_radio_detalhes1
  alias_attribute :radio_detalhes2, :ava_radio_detalhes2
  alias_attribute :radio_detalhes3, :ava_radio_detalhes3
  alias_attribute :radio_detalhes4, :ava_radio_detalhes4
  alias_attribute :perda_ossa_reg_lateral, :ava_perdaOsseaRegLateral
  alias_attribute :perda_ossea_reg_lateral_local, :ava_perdaOsseaRegLateralLocal
  alias_attribute :perda_ossea_perio, :ava_perdaOsseaPerio
  alias_attribute :tratamento_endo, :ava_tratamentoEndo
  alias_attribute :tratamento_endo_sat_tempo, :ava_tratamentoEndoSatTempo
  alias_attribute :tratamento_endo_ins_tempo, :ava_tratamentoEndoInsTempo
  alias_attribute :caract_apar0, :ava_caractApar
  alias_attribute :caract_apar1, :ava_caractApar1
  alias_attribute :caract_apar2, :ava_caractApar2
  alias_attribute :caract_apar3, :ava_caractApar3
  alias_attribute :caract_apar4, :ava_caractApar4
  alias_attribute :caract_apar5, :ava_caractApar5
  alias_attribute :caract_apar6, :ava_caractApar6
  alias_attribute :caract_apar_canais_n_trat, :ava_caractAparCanaisNTrat
  alias_attribute :caract_apar_cones_prata, :ava_caractAparConesPrata
  alias_attribute :tomo, :ava_tomo
  alias_attribute :tomo_detalhes, :ava_tomoDetalhes
  alias_attribute :diagnostico_pulpar, :ava_diagnosticoPulpar
  alias_attribute :diagnostico_periapical, :ava_diagnosticoPeriapical
  alias_attribute :diagnostico_periodontal, :ava_diagnosticoPeriodontal
  alias_attribute :diagnostico_outros, :ava_diagnosticoOutros
  alias_attribute :diagnostico_obs, :ava_diagnosticoObs
  alias_attribute :tratamento, :ava_tratamento
  alias_attribute :tratamento_outros, :ava_tratamentoOutros


  # Métodos extras para lidar com os campos que são divididos com asterisco
  [
    :sintomas_tipo,
    :sintomas_fatores_estimulantes,
    :sintomas_fatores_atenuantes,
    :sintomas_associados,
    :hist_clinica_tratamentos_tipo,
    :intra_oral_coroa,
    :intra_oral_face_bolsa_perio,
    :intra_oral_hiperplasia_tec,
    :diagnostico_periodontal,
    :diagnostico_outros,
    :tratamento
  ].each do |method|
    method_str = method.to_s

    define_method(method_str + '_list') do
      if self.send(method).nil?
        ''
      else
        self.send(method).split('*').select { |string| string.size > 0 }
      end
    end

    define_method(method_str + '_list=') do |list|
      self.send(method_str + '=', list.select { |s| s.length > 0 }.join('*'))
    end
  end

end

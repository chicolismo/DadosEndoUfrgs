class AvaliacoesController < ApplicationController
  Option = Struct.new(:id, :name)

  def new
    @paciente = Paciente.find(params[:paciente_id])
    @usuario = current_user
    @avaliacao = Avaliacao.new
    @avaliacao.usuario = @usuario
    @avaliacao.paciente = @paciente
    define_options
  end

  def edit
    @avaliacao = Avaliacao.find(params[:id])
    define_options
  end

  def create
    @avaliacao = Avaliacao.new(avaliacao_params)

    if @avaliacao.save
      redirect_to @avaliacao.paciente
    else
      raise @avaliacao.inspect
      redirect_back(:fallback_location => root_url)
    end
  end

  def update
    @avaliacao = Avaliacao.find(params[:id])
    @avaliacao.update_attributes(avaliacao_params)

    if @avaliacao.save
      redirect_to @avaliacao.paciente
    else
      raise params.inspect
      redirect_back(:fallback_location => root_url)
    end
  end

  def destroy
    avaliacao = Avaliacao.find(params[:id])
    paciente = avaliacao.paciente
    avaliacao.delete
    redirect_to paciente
  end

  private

  def define_options
    @option = Option

    @sintomas_options = ['Ausentes', 'Ausentes com antecedentes', 'Presentes'].map do |string|
       Option.new(string, string)
    end

    @sintomas_tipo_options = ['Pulsátil', 'Latejante', 'Noturno', 'Nenhuma das anteriores', 'Não coletado'].map do |string|
      Option.new(string, string)
    end

    @sintomas_fatores_estimulantes_options = ['Nenhuma', 'Frio', 'Quente', 'Cítricos', 'Doce', 'Abertura de boca', 'Postura', 'Viagem aérea', 'Pressão dos dedos', 'Exercícios', 'Ao morder', 'Não coletado'].map do |string|
      Option.new(string.downcase, string)
    end

    @sintomas_fatores_atenuantes_options = ['Nenhuma', 'Frio', 'Quente', 'Pressão dos dedos', 'Ao morder', 'Analgésico', 'Descanso', 'Exercícios', 'Postura', 'Viagem aérea', 'Não coletado'].map do |string|
      Option.new(string.downcase, string)
    end

    @sintomas_associados_options = ['Nenhuma', 'Otalgia', 'Transpiração', 'Fotofobia', 'Mal estar', 'Febre', 'Dor de cabeça', 'Fonofobia', 'Não coletado'].map do |string|
      Option.new(string.downcase, string)
    end

    @hist_clinica_traumatismo_options = ['Não', 'Sim', 'Não coletado'].map do |string|
      Option.new(string.downcase, string)
    end

    @hist_clinica_tratamentos_realizados_options = ['Não', 'Sim', 'Não coletado'].map do |string|
      Option.new(string.downcase, string)
    end

    @hist_clinica_tratamentos_tipo_options = [
      'Capeamento',
      'Tratamento endodôntico',
      'Tratamento restaurador',
      'Pulpotomia',
      'Cirurgia paraendodôntica',
      'Remoção parcial de tecido cariado',
      'Curetagem pulpar',
      'Tratamento periodontal',
      'Apicificação',
      'Reposicionamento pós-trauma',
      'Atendimento de urgência',
      'Ortodontia',
      'Não coletado'
    ].map { |string| Option.new(string.downcase, string) }

    @extra_oral_edema_options = ['Ausente', 'Presente/Difuso', 'Presente/Com ponto de flutuação', 'Não coletado'].map do |string|
      Option.new(string.downcase, string)
    end

    @extra_oral_exame_options = ['Ausente', 'Presente', 'Não coletado'].map do |string|
      Option.new(string.downcase, string)
    end

    @intra_oral_rastreamento_options = ['Não', 'Sim', 'Não coletado'].map do |string|
      Option.new(string.downcase, string)
    end

    @intra_oral_origem_processo_options = ['Periápice', 'Região de furca', 'Periodonto', 'Dado não coletado'].map do |string|
      Option.new(string.downcase, string)
    end

    @intra_oral_adapt_marginal_options = ['satisfatória', 'insatisfatória', 'não se aplica'].map do |string|
      Option.new(string.downcase, string)
    end

    @intra_oral_coroa_options_1 = ['Ausente', 'Integra', 'Cariada', 'Destruição coronária',
      'Fratura Coronária', 'Coroa protética'].map do |string|
      Option.new(string.downcase, string)
    end

    @intra_oral_coroa_options_2 = ['Prognóstico restaurador duvidoso', 'Exposição da cavidade pulpar',
      'Alteração cromática', 'Dado não coletado'].map do |string|
      Option.new(string.downcase, string)
    end

    @intra_oral_coroa_options_3 = ['Mobilidade dental', 'Contato prematuro', 'Sobrecarga mastigatória'].map do |string|
      Option.new(string.downcase, string)
    end

    @intra_oral_inclinacao_dente_options = ['Inclinação leve (<10º)', 'Inclinação moderada (10-30º)',
      'Inclinação extrema (>30º)', 'Dado não coletado'].map { |string| Option.new(string.downcase, string) }

    @intra_oral_giroversao_options = ['Rotação ausente', 'Rotação leve (<10º)',
      'Rotação moderada (10-30º)', 'Rotação extrema (>30º)'].map { |string| Option.new(string.downcase, string) }

    @intra_oral_hiperplasia_tec_options = ['Ausente', 'Presente/origem na gengiva marginal',
      'Presente/origem na cavidade dental', 'Dado não coletado'].map { |string| Option.new(string.downcase, string) }

    @diagnostico_pulpar_options = ['Polpa saudável', 'Pulpite com prognóstico reversível',
      'Pulpite com prognóstico irreversível', 'Úlcera pulpar', 'Pólipo pulpar',
      'Necrose pulpar', 'Dado não coletado'].map { |string| Option.new(string.downcase, string) }

    @diagnostico_periapical_options_1 = ['Perápice saudável', 'Dado não coletado'].map do |string|
      Option.new(string.downcase, string)
    end

    @diagnostico_periapical_options_2 = ['Pericementite apical traumática', 'Pericementite apical infecciosa',
     'Abcesso apical agudo inicial', 'Abcesso apical agudo em evolução', 'Abcesso apical agudo evoluído'].map do |string|
      Option.new(string.downcase, string)
    end

    @diagnostico_periapical_options_3 = ['Com fístula', 'Sem fístula'].map do |string|
      Option.new(string.downcase, string)
    end

    @diagnostico_periodontal_options = ['Periodonto saudável', 'Periodontite', 'Pólipo gengival',
     'Gengivo estomatite herpética aguda', 'Lesão endoperiodontal', 'Gengivite', 'Pólipo periodontal',
     'Eritema linear', 'Abcesso periodontal', 'Abscesso gengival periocoronarite', 'GUNA', 'PUNA',
     'Dado não coletado'].map { |string| Option.new(string.downcase, string) }

    @diagnostico_outros_options = ["Fratura radicular vertical", "Fratura radicular horizontal",
      "Fratura radicular obliqua", "Reabsorção interna", "Reabsorção externa inflamatória",
      "Reabsorção comunicante", "Reabsorção externa substitutiva", "Reabsorção cervical", "Trauma oclusal",
      "Sensibilidade dentinária", "Dado não coletado"].map { |string| Option.new(string.downcase, string) }

    @tratamento_options_1 = ["Dado não coletado", "Proservação", "Atendimento de urgência",
      "Alívio oclusal", "Tratamento restaurador", "Tratamento periodontal",
      "Dor orofacial", "Exodontia", "Avaliação protética"].map { |string| Option.new(string.downcase, string) }

    @tratamento_options_2 = ["Remoção parcial de tecido cariado", "Capeamento pulpar indireto",
      "Capeamento pulpar direto", "Curetagem pulpar", "Pulpotomia"].map { |string| Option.new(string.downcase, string) }

    @tratamento_options_3 = ["Apicigênese", "Apicificação", "Revascularização",
      "Tratamento endodôntico", "Retratamento endodôntico", "Cirurgia paraendodôntica",
      "Tratamento endodôntico com finalidade protética"].map { |string| Option.new(string.downcase, string) }

  end

  def avaliacao_params
    params.require(:avaliacao).permit(
      :paciente_id,
      :usuario_id,
      :data,
      :responsavel_atendimento,
      :queixa_principal,
      :regiao_afetada,
      :sintomas,
      :escala_de_dor,
      :sintomas_inicio,
      :sintomas_intensidade,
      :sintomas_localizacao,
      :sintomas_duracao,
      :sintomas_estimulo,
      #:sintomas_tipo,
      { :sintomas_tipo_list => [] },
      #:sintomas_fatores_estimulantes,
      { :sintomas_fatores_estimulantes_list => [] },
      #:sintomas_fatores_atenuantes,
      { :sintomas_fatores_atenuantes_list => [] },
      #:sintomas_associados,
      { :sintomas_associados_list => [] },
      :hist_clinica_carie,
      :hist_clinica_traumatismo,
      :hist_clinica_trauma_tipo,
      :hist_clinica_periodo_trauma,
      :hist_clinica_tratamentos_realizados,
      #:hist_clinica_tratamentos_tipo,
      { :hist_clinica_tratamentos_tipo_list => [] },
      :extra_oral_edema,
      :extra_oral_local_edema,
      :extra_oral_linfo_ade,
      :extra_oral_local_linfo_ade,
      :extra_oral_dor_palpa,
      :extra_oral_regiao_dor,
      :extra_oral_fistula,
      :extra_oral_local_fistula,
      :extra_oral_outras_obs,
      :intra_oral_rastreamento,
      :intra_oral_origem_processo,
      #:intra_oral_coroa,
      { :intra_oral_coroa_list => [] },
      :intra_oral_material,
      :intra_oral_adapt_marginal,
      :intra_oral_material2,
      :intra_oral_adapt_marginal2,
      :intra_oral_outras,
      :intra_oral_material3,
      :intra_oral_inclinacao_dente,
      :intra_oral_giroversao,
      :intra_oral_bolsa_perio,
      #:intra_oral_face_bolsa_perio,
      { :intra_oral_face_bolsa_perio_list => [] },
      :intra_oral_face_bolsa_perio_vestibular,
      :intra_oral_face_bolsa_perio_palatina,
      :intra_oral_face_bolsa_perio_lingual,
      :intra_oral_face_bolsa_perio_mesial,
      :intra_oral_face_bolsa_perio_distal,
      :intra_oral_rast_bolsa_perio,
      :intra_oral_local_bolsa_perio,
      :intra_oral_necrose_papilar,
      :intra_oral_eritema_gengival,
      :intra_oral_inv_espaco_bio,
      :intra_oral_retracao_gengival,
      :intra_oral_hiperplasia_tec,
      #{ :intra_oral_hiperplasia_tec_list => [] },
      :radio_alt_periapical,
      :radio_indice_periapical,
      :radio_detalhes,
      :radio_detalhes_terco,
      :radio_detalhes1,
      :radio_detalhes2,
      :radio_detalhes3,
      :radio_detalhes4,
      :perda_ossa_reg_lateral,
      :perda_ossea_reg_lateral_local,
      :perda_ossea_perio,
      :tratamento_endo,
      :tratamento_endo_sat_tempo,
      :tratamento_endo_ins_tempo,
      :caract_apar0,
      :caract_apar1,
      :caract_apar2,
      :caract_apar3,
      :caract_apar4,
      :caract_apar5,
      :caract_apar6,
      :caract_apar_canais_n_trat,
      :caract_apar_cones_prata,
      :tomo,
      :tomo_detalhes,
      :diagnostico_pulpar,
      :diagnostico_periapical,
      #:diagnostico_periodontal,
      { :diagnostico_periodontal_list => [] },
      #:diagnostico_outros,
      { :diagnostico_outros_list => [] },
      :diagnostico_obs,
      #:tratamento,
      { :tratamento_list => [] },
      :tratamento_outros,
    )
  end

end

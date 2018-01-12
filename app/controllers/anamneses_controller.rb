class AnamnesesController < ApplicationController
  Option = Struct.new(:id, :name)

  # Não há index para as anamneses

  def show
    @anamnese = Anamnese.find(params[:id])
  end

  def new
    @anamnese = Anamnese.new
    @anamnese.paciente = Paciente.find(params[:paciente_id])
    @anamnese.usuario = current_user
    define_form_options
  end

  def edit
    @anamnese = Anamnese.find(params[:id])
    define_form_options
  end

  def create
    @anamnese = Anamnese.new(anamnese_params)
    # TODO: Colocar mensagem de flash alert com o aviso de erro
    if @anamnese.save
      redirect_to(@anamnese.paciente)
    else
      redirect_back(:fallback_location => root_path)
    end
  end

  def update
    @anamnese = Anamnese.find(params[:id])
    @anamnese.update(anamnese_params)

    # TODO: Colocar mensagem de flash alert com o aviso de erro
    if @anamnese.save
      redirect_to(@anamnese.paciente)
    else
      redirect_back(:fallback_location => root_path)
    end
  end

  def destroy
    anamnese = Anamnese.find(params[:id])
    paciente = anamnese.paciente
    anamnese.destroy
    redirect_to paciente
  end

  private

  def define_form_options
    @cardiovasculopatias_options = cardiovasculopatias_options
    @hepatopatias_options = hepatopatias_options
    @dm_options = dm_options
    @hiv_options = hiv_options
    @freq_options = freq_options
  end

  def anamnese_params
    params.require(:anamnese).permit(
      :usuario_id,
      :paciente_id,
      :data,
      :tratamento_medico,
      :tratamento_medico_motivo,
      :usa_medicamentos,
      :lista_de_medicamentos,
      :procedimento_cirurgia,
      :qual_procedimento_cirurgia,
      :pa,
      :valor_pa,
      :febre_reumatica,
      :cardiovascular,
      #:cardiovasculopatias,
      { :cardiovasculopatias_list => [] },
      :asma,
      :dificuldade_de_respiracao,
      #:hepatopatias,
      { :hepatopatias_list => [] },
      :dm,
      :artrite,
      :bisfosfonado,
      :gastro,
      :nefro,
      :soro_hiv,
      :onco,
      :onco_tipo,
      :hemofilia,
      :gestante,
      :anemia,
      :drogas,
      :drogas_tipo,
      :drogas_frequencia,
      :alcool,
      :alcool_frequencia,
      :tabaco,
      :tabaco_tipo,
      :tabaco_frequencia,
      :alergia_med,
      :alergia_med_tipo,
      :peso,
      :peso2,
      :altura,
      :altura2,
      :queixa_pricipal
    )
  end

  def cardiovasculopatias_options
    %w{Angina AVC Marca-Passo Válvula\ Cardíaca Histórico\ de\ Infarto Arritmia Dado\ não\ Coletado}.map do |string|
      Option.new(string, string)
    end
  end

  def hepatopatias_options
    %w{não hepatite\ A hepatite\ B hepatite\ C cirrose dado\ não\ coletado}.map do |string|
      Option.new(string, string)
    end
  end

  # NOTE: Infelizmente alguém guardou a informação errada
  #  no banco, e temos que continuar usando assim
  def dm_options
    { 'não' => 'Não',
      'sim, tipo I' => 'Sim, tipo I',
      'sim, tipo II' => 'Sim, tipo II',
      'sim, gestacional' => 'Sim, gestacional',
      'dado não coletador' => 'Dado não coletado' }.map { |key, value| Option.new(key, value) }
  end

  def hiv_options
    ['negativo', 'positivo', 'dado não coletado'].map do |string|
      Option.new(string, string)
    end
  end

  def freq_options
    ['diária', 'esporádica', 'pelo menos uma vez por semana', 'dado não coletado'].map do |string|
      Option.new(string, string)
    end
  end
end

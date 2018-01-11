class PacientesController < ApplicationController
  def index
    name = params[:name]

    # Busca pacientes cujos nomes contenham a "string" pesquisada
    # O resultado será ordenado pelos nomes dos pacientes de forma alfabética
    # Cada página exibirá 20 resultados
    @pacientes = if name.nil?
                   Paciente.order(:nome).page(params[:page]).per(20)
                 else
                   Paciente
                     .search_by_name(name) #.includes([:anamneses, :avaliacoes, :tratamentos])
                     .order(:nome)
                     .page(params[:page])
                     .per(20)
                 end
  end

  def show
    @paciente = Paciente.find(params[:id])
  end

  def new
    @paciente = Paciente.new
  end

  def edit
    id = params[:id]
    @paciente = Paciente.find(id)
  end

  def create
    @paciente = Paciente.new(paciente_params)
    if @paciente.save
      redirect_to(@paciente)
    else
      redirect_back(:fallback_location => root_path)
    end
  end

  def update
    @paciente = Paciente.find(params[:id])
    @paciente.update(paciente_params)

    if @paciente.save
      redirect_to(@paciente)
    else
      redirect_back(:fallback_location => root_path)
    end
  end

  private

  def paciente_params
    params.require(:paciente).permit(:nome, :rg, :cpf, :nascimento, :sexo,
      :endereco, :telefone, :email, :acompanhante)
  end
end

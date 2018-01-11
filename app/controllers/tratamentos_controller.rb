class TratamentosController < ApplicationController
  #def index
  #end

  #def show
  #end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
    tratamento = Tratamento.find(params[:id])
    paciente = tratamento.paciente
    tratamento.delete
    redirect_to paciente
  end
end

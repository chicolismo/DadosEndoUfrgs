class PacientsController < ApplicationController
  def index
    @pacients = Pacient.order(:name).page params[:page]
  end
end

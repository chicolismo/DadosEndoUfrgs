class HomeController < ApplicationController
  def index
    #@pacients = Pacient.all.limit(100)
    @anamneses = Anamnese.all.limit(100)
  end
end

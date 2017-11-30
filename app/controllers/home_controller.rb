class HomeController < ApplicationController
  def index
    #@pacients = Pacient.all.limit(100)
    @anamneses = Anamnesis.all.limit(100)
  end
end

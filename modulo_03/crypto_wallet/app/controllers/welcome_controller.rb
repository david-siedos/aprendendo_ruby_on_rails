class WelcomeController < ApplicationController
  def index
    @meu_nome = "David"
    #@meu_nome = params[:nome]
  end
end

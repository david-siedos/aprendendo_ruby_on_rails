class Pessoa
    def falar # metodo de instancia
        puts "Olá !!!"
    end
    
    def self.gritar(texto) # metodo de classe / NAO precisa instanciar
        "#{texto}!!!!!"
    end
end


puts Pessoa.gritar("grito")
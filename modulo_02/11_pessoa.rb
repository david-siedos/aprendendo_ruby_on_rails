class Pessoa
    def initialize(cont = 1)
        cont.times do |i|
            puts "Inicializando... #{i+1}"
        end
    end
    
    def falar(texto = "Olá, pessoal!")
        texto
    end
    
    def falar2(nome = "pessoal")
        puts "Olá #{nome}!!!"
    end

    def falar3(texto = "olá!", texto2 = "hello!")
        "#{texto} - #{texto2}"
    end
end

p1 = Pessoa.new
#puts p.falar(gets.chomp)
puts p1.falar("Olá, fulano de tal!")
puts p1.falar2("david")
puts p1.falar3("Oi", "yes")

p2 = Pessoa.new(5)
puts p2.falar2("P2 !!!!!")

class Pessoa
    attr_accessor :nome, :email
end

class PessoaFisica < Pessoa
    attr_accessor :cpf

    def falar(texto)
        texto
    end
end

class PessoaJuridica < Pessoa
    attr_accessor :cnpj

    def pagar_fornecedor
        "Pagando fornecedor..."  
    end
end

p1 = Pessoa.new
puts p1.nome = "david"
puts p1.email = "david@gmail.com"
puts("--------------------------")

#---------------------------------
p2 = PessoaFisica.new
#setter
p2.nome = "andreia"
p2.email = "andreia@gmail.com"
p2.cpf = "12345678"

#getter
puts p2.nome
puts p2.email
puts p2.cpf

puts p2.falar("Heyoou!!!")
puts("--------------------------")

#---------------------------------
p3 = PessoaJuridica.new
#setter
p3.nome = "CodeTower"
p3.email = "codetower@gmail.com"
p3.cnpj = "2657389-723"

#getter
puts p3.nome
puts p3.email
puts p3.cnpj

puts p3.pagar_fornecedor
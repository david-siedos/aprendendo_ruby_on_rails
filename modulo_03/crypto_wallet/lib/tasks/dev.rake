namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
       
       show_spinner("Apagando BD...") do
        %x(rails db:drop)
       end
       
       show_spinner("Criando BD...") do
        %x(rails db:create) 
       end

       show_spinner("Migrando BD...") do
        %x(rails db:migrate) 
       end
       
       %x(rails dev:add_mining_types)
       
       %x(rails dev:add_coins)

    else
      puts "Voce nao esta em ambiente de desenvolvimento"
    end
  end
  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
      coins = [
                { 
                    description: "Bitcoin",
                    acronym: "BTC",
                    url_image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRewQoPbineQHwaypFEwjsWZ_2IsEtc5UWEGtjvryuxJqFngZsfSq4lbPEbrubaUeuW_T0&usqp=CAU",
                    mining_type: MiningType.find_by(acronym: 'PoW')
                },   
                { 
                    description: "Etherium",
                    acronym: "ETH",
                    url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png",
                    mining_type: MiningType.all.sample
                },
                { 
                    description: "Dash",
                    acronym: "DASH",
                    url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/131.png",
                    mining_type: MiningType.all.sample
                }
              ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end
  

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração...") do
      mining_types = [
                      {description: "Proof of Work",acronym: "PoW"},
                      {description: "Proof of Stake",acronym: "PoS"},
                      {description: "Proof of Capacity",acronym: "PoC"}
                    ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end

end

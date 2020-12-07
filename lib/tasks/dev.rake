require 'tty-spinner'

namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando banco...") { %x(rails db:drop) }
      show_spinner("Criando banco...") { %x(rails db:create) }
      show_spinner("Migrando banco...") { %x(rails db:migrate) }
=begin
        Adicione novas tarefas nas linhas abaixo
        %x(rails dev:add_users)
=end
      %x(rails dev:add_users)
    else
      puts "Você não está em ambiente de desenvolvimento!\nJá ia apagar todos os dados..."
    end
  end

=begin
    Crie tasks com spinner semelhante à este template

    desc "Cadastra Usuários"
    task add_users: :environment do
        show_spinner("Cadastrando Usuários...") do
            users = [
                {
                    first_name: "João",
                    last_name: "Ferreira",
                    password: "senha muito forte 123",
                    email: "joaoferreira@gmail.com"
                },
                {
                    first_name: "Roberta",
                    last_name: "Ferreira",
                    password: "senha mais forte que do joao",
                    email: "robertaferreira@outlook.com.br"
                }
            ]

            users.each { |user| User.find_or_create_by!(user) }
        end
    end
=end

  desc "Cadastra Usuários"
  task add_users: :environment do
      show_spinner("Cadastrando Usuários...") do
          users = [
              User.new(
                  full_name: "João Ferreira",
                  email: "joaoferreira@gmail.com",
                  password: 'senha encriptada',
                  nickname: 'joaopolo21',
                  birth_date: '2000-01-01',
                  gender: :male
              ),
              User.new(
                  full_name: "Roberta Ferreira",
                  email: "robertaferreira@outlook.com.br",
                  password: 'senha ainda mais encriptada',
                  nickname: 'roberta_mais',
                  birth_date: '2001-02-26',
                  gender: :female
              )
          ]

          users.each { |user| user.save! }
      end
  end

  private
    def show_spinner(start_message, end_message = "Concluído!")
      spinner = TTY::Spinner.new(":spinner #{start_message}", format: :bouncing)
        spinner.auto_spin
        yield
        spinner.success("(#{end_message})")
    end
end

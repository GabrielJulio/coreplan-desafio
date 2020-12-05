require 'tty-spinner'

namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando banco...", "Banco apagado com sucesso!") { %x(rails db:drop) }
      show_spinner("Criando banco...", "Banco criado com sucesso!") { %x(rails db:create) }
      show_spinner("Migrando banco...", "Banco migrado com sucesso!") { %x(rails db:migrate) }
=begin
        Adicione novas tarefas nas linhas abaixo
        %x(rails dev:add_users)
=end

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

  private
    def show_spinner(start_message, end_message = "Concluído!")
      spinner = TTY::Spinner.new(":spinner #{start_message}", format: :bouncing)
        spinner.auto_spin
        yield
        spinner.success("(#{end_message})")
    end
end

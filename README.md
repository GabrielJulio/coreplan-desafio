# Seja bem-vindo!

### Requisitos
- Docker
- Ruby 2.7.2 (instalado pelo Docker)

### Como executar
1. Clone o projeto
1. Entre na pasta do projeto e execute: 
    - **OBS: Recomendamos que faça um café :coffee: enquanto as gems :gem: são baixadas e instaladas**
    ```bash
    docker-compose build
    ```
1. Agora é só executar e a aplicação estará rodando em ``localhost:3000``:
    ```bash
    docker-compose up
    ```

### Comandos
- Para iniciar a aplicação execute: 
    ```bash
    docker-compose up
    ```
- Para encerrar a aplicação execute: 
    ```bash
    docker-compose down
    ```
- Para executar um comandos execute: 
    ```bash
    docker-compose run web <comando>
    ```
- Quer instalou novas gems? Refaça o build.
    ```bash
    docker-compose build
    ```


### Banco de Dados
- Preparação para Desenvolvimento:
    ```bash
    rails dev:setup
    ```

### Imagens
<img src="https://github.com/GabrielJulio/coreplan-desafio/blob/master/repo_images/main_screen.jpg" width="800" height="500"/>
<img src="https://github.com/GabrielJulio/coreplan-desafio/blob/master/repo_images/login_screen.jpg" width="800" height="500"/>
<img src="https://github.com/GabrielJulio/coreplan-desafio/blob/master/repo_images/no_avatar.jpg" width="800" height="500"/>
<img src="https://github.com/GabrielJulio/coreplan-desafio/blob/master/repo_images/search_with_avatar.jpg" width="800" height="500"/>
<img src="https://github.com/GabrielJulio/coreplan-desafio/blob/master/repo_images/errors.png" width="800" height="500"/>
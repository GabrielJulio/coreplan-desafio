# Seja bem-vindo!

### Requisitos
- Ruby 2.7.2
- Docker

### Como executar (Primeira vez)
1. Clone o projeto
1. Entre na pasta do projeto e execute: 
    - **OBS: Recomendamos que faça um café :coffee: enquanto as gems :gem: são baixadas e instaladas**
    ```bash
    docker-compose build
    ```
1. Agora é só executar e a aplicação estará ordando em ``localhost:3000``:
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

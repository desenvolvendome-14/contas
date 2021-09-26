# Contas

Serviços responsavel pelas contas(despesas e faturas) do sistema

## Dependências

- Ruby 3.0.4
- Rails 6.1.4
- Postgres >=10.10

Caso não tenha postgres instalado, tem o arquivo `docker-compose.yml` para subir um container com postgres. Para isso instalar  docker.

## Documentação da API 

- link: [squad-contas.postman.co](squad-contas.postman.co)
- Arquivo: [doc/preco_certo.postman_collection.json](https://raw.githubusercontent.com/desenvolvendome-14/contas/tree/doc/Contas.postman_collection.json)
<!-- - Variables environments -->

## Setup

1. `git clone https://github.com/desenvolvendome-14/contas.git`
2. `cd contas`
3. `cp .env.sample .env` (caso haja necessidade mude as variáveis)
4. `docker-compose up -d` **(Só para quem usará o postgres no docker)**
5. `rake db:create db:migrate db:seed`
6. `rspec spec/` (para verificar se todos os testes estão ok)
6. `rails s`
7. Abrir o link [localhost:3000](localhost:3000)

## Desenvolvimento

- Seguir padrões de código, utilizamos o rubocop.
- Verificar se a funcionalidade que desenvolveu está testada, para isso a gem simplecov.
- Verificar qualidade de código com rubycritic e rubocop.
- Temos uma action no GitHub para verificar se todos teste estão passando e se tem alguma alteração para a qualidade de código com rubocop

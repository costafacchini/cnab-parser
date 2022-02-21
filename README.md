## Challenge

Você recebeu um arquivo CNAB com os dados das movimentações finanaceira de várias lojas. Precisamos criar uma maneira para que estes dados sejam importados para um banco de dados.

Sua tarefa é criar uma interface web que aceite upload do arquivo CNAB, normalize os dados e armazene-os em um banco de dados relacional e exiba essas informações em tela.

## Specifications

- [ ] Ter uma tela (via um formulário) para fazer o upload do arquivo (pontos extras se não usar um popular CSS Framework)
- [ ] Interpretar ("parsear") o arquivo recebido, normalizar os dados, e salvar corretamente a informação em um banco de dados relacional, se atente as documentações que estão logo abaixo.
- [ ] Exibir uma lista das operações importadas por lojas, e nesta lista deve conter um totalizador do saldo em conta
- [X] Ser escrita obrigatoriamente em Ruby 2.0+ e Rails 5+
- [ ] Ser simples de configurar e rodar, funcionando em ambiente compatível com Unix (Linux ou Mac OS X). Ela deve utilizar apenas linguagens e bibliotecas livres ou gratuitas.
- [ ] Git com commits bem descritos
- [X] PostgreSQL
- [X] RUBOCOP
- [X] RSPEC
- [X] Simplecov para disponibilizar o code coverage
- [X] Docker compose (Pontos extras se utilizar)
- [ ] Readme file descrevendo bem o projeto e seu setup
- [ ] Incluir informação descrevendo como consumir o endpoint da API

## Setup Ruby (only if you have not installed)

This project uses [asdf](https://asdf-vm.com/#/). \
Follow the installation [instructions](https://asdf-vm.com/#/core-manage-asdf?id=asdf)

After installation you need to follow these steps:

```bash
# Add ruby plugin on asdf
$ asdf plugin add ruby
# Install ruby plugin
$ asdf install ruby 3.0.3
# Set the default ruby for the project
$ asdf local ruby 3.0.3
```

## Setup Project

```bash
# install bundler
$ gem install bundler
# run bundle to install gems
$ bundle
```

## Database initialization
```bash
# turn on docker
$ docker-compose up -d
# setup database
$ bin/rails db:setup
# run migrations
$ bin/rails db:migrate
```

## Linter
```bash
# run rubocop
$ bin/rubocop
```

## Run tests
```bash
# turn on docker
$ docker-compose up -d
# run rspec
$ bundle exec rspec
```

## Start Project
```bash
# turn on docker
$ docker-compose up -d
# run rails server
$ bin/rails server
```

# Projeto Etapa 1 - Treinadev 5

## Balcão de Empregos

> Status: Em desenvolvimento :warning:

### Proposta
Projeto consiste na criação de uma plataforma Web para que pessoas dos departamentos de RH de empresas criem vagas e sejam capazes de gerenciar todo processo de forma colaborativa. Além disso, a plataforma funciona como um site de busca de oportunidades para os visitantes. Um visitante pode conhecer empresas, ver suas vagas disponíveis e aplicar para estas vagas.

### Funcionalidades

- [x] Cadastro de recrutadores
- [x] Cadastro de candidatos
- [x] Cadastro de vagas

### Como rodar a aplicação

No terminal execute o comando abaixo para fazer o clone do projeto na sua máquina:
```bash
git clone https://github.com/crisaito/t5-balcao_empregos.git
```

Acesse a pasta do projeto:
```bash
cd t5-balcao_empregos
```

Instale as gems para executar a aplicação:
```bash
bundle install
```

Se desejar, a aplicação já possui dados para testes no banco, apenas execute o comando:
```bash
rails db:seed
```
Com esse banco é possível fazer login com os seguintes usuários:

|   | email | password |
| --- | --- | --- |
| Recrutador | ana@coca.com.br | 123456 |
| Candidato | cristiane@gmail.com.br | 123456 |

Para visualizar os testes execute:
```bash
rspec -fd
```

Para visualizar a aplicação no navegador execute:
```bash
rails s
```

Digite no endereço do navegador o caminho padrão de visualização:
http://127.0.0.1:3000


### Kanban
* [Trello](https://trello.com/b/dohfWWWv/treinadev-projeto-final-balc%C3%A3o-de-empregos)

### Wireframes
* [Figma](https://www.figma.com/file/HEoeEnfClHhOAMBGNrh2No/treinadev)

### Gems utilizadas
* [Rspec](https://github.com/rspec/rspec-rails)
* [Capybara](https://github.com/teamcapybara/capybara)
* [Devise](https://github.com/heartcombo/devise)
* [Bootstrap](https://github.com/twbs/bootstrap-rubygem)
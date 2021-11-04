Foi criado esse projeto com intuito de mostrar o ServeRest (https://serverest.dev/), que permite o estudo de:

- Verbos *GET, POST, PUT* e *DELETE* com persistência de dados
- Autenticação no header
- Query string
- Teste de schema json


### 1. Para subir o servido localmente com NPM

Execute o seguinte comando no terminal:  

```sh
npx serverest@latest
```

Para baixar o projeto:
```sh
git clone https://github.com/reinaldorossetti/ruby-api-httparty.git
```
Caminho do arquivo de configuração do servidor no projeto:  
ruby-api-httparty / spec / support / data / homolog.yml  
```
url_padrao: 'http://localhost:3000'
```
* Se precisar mudar a porta do servidor mudar também nesse arquivo.  

Utilizamos as seguintes bibliotecas:  
```
gem 'rspec'
gem 'faker', '~> 2.18.0'
gem 'httparty', '~> 0.18.1'
gem 'pact', '~> 1.57'
gem 'json-schema', '~> 2.8.1'
```

Primeiro precisa baixar o gerenciado de dependencias que é o bundle
```
gem install bundle
```

- Como é um projeto de testes somente fiz os testes da feature de usuários, mas ideia é utilizar todos os verbos *GET, POST, PUT* e *DELETE*.  

Foi utilizado, o faker para gerar dados do usuário, json-schema para validação do contrato, json para ler os dados em json e ostruct para transformar para objetos.  
```
require 'faker'
require "json-schema"
require 'json'
require 'ostruct'
```

Comando para instalar as bibliotecas:
```
bundle install
```

Comando para rodar os testes da feature de usuários:
```
bundle exec rspec spec/tests/register_user.rb
```

Vídeos curtos do nosso projeto, somente pra explicar a lógica e execução:
https://www.loom.com/share/0124b9b21086495f84c560a25a83debd
https://www.loom.com/share/dcba13d058b74fd5926f42201b26016d


Para conhecer a API pública de estudos **ServeRest** que utilizei para os testes [clique aqui](https://serverest.dev/).

Para criar o json schema copie o body da requisição para dentro da tools de jsonschema [clique aqui](https://www.jsonschema.net/home)

Referências:  
https://github.com/serverest/serverest  
https://github.com/ruby-json-schema/json-schema/tree/master  
https://github.com/jnunemaker/httparty  

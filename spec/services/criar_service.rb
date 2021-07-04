require 'faker'

module Service
  # quando dou o include estou extendendo as funcionalidade de HTTParty.
  include HTTParty
  #url base de contato
  base_uri CONFIG['url_padrao']
  #opcoes do meu service
  format :json
  headers Accept: 'application/vnd.tasksmanager.v2',
          'Content-Type': 'application/json'
end
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

module User

  @name_value = Faker::Name.name
  @email_value = Faker::Internet.email
  @password_value = Faker::Internet.password

  def self.name_value
    @password_value
  end

  def self.email_value
    @email_value
  end

  def self.password
    @password_value
  end

end
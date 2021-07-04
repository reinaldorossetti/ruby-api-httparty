RSpec.describe do

  it 'Cadastrar usuário de teste' do
    p @body = { "nome": User.full_name, "email": User.email, "password": User.password, "administrador": "true" }
              .to_json
    @response = Service.post('/usuarios', body: @body)
    expect(@response.code).to eq 201
    p @response.body
    p schema = JSON.parse(File.read($schema_json_register))
    JSON::Validator.validate!(schema, @response.body, strict: true)
  end

  it 'Cadastrar usuário de teste negativo' do
    p @body = { "nome": User.full_name, "email": User.email, "password": User.password, "administrador": "true" }
              .to_json
    @response = Service.post('/usuarios', body: @body)
    expect(@response.code).to eq 201
    p schema = JSON.parse(File.read($schema_json_user))
    JSON::Validator.validate!(schema, @response.body, strict: true)
  end

end
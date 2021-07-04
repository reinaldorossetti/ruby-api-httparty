RSpec.describe do
  it 'Cadastrar usuário de teste' do
    p @body = { "nome": User.full_name, "email": User.email, "password": User.password, "administrador": "true" }
              .to_json
    @response = Service.post('/usuarios', body: @body)
    expect(@response.code).to eq 201
    p $schema_register, @response.body
    JSON::Validator.validate!(@response.body, $schema_register, strict: true)
  end
end
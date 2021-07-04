RSpec.describe do
  it 'Cadastrar usuário de teste' do
    @body = { "nome": User.name_value, "email": User.email_value, "password": User.password, "administrador": "true" }
              .to_json
    @request = Service.post('/usuarios', body: @body)
    p @request.body
    expect(@request.code).to eq 201
  end
end
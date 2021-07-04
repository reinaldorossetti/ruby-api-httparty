RSpec.describe do
  it 'Cadastrar usuário de teste' do
    p @body = { "nome": User.full_name, "email": User.email, "password": User.password, "administrador": "true" }
              .to_json
    @request = Service.post('/usuarios', body: @body)
    p @request.body
    expect(@request.code).to eq 201
  end
end
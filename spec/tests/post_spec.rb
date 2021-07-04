describe 'fazer uma requicisao' do
  it 'post' do
      @body = {
        "name": "bruno batista 26",
        "last_name": "batista 26",
        "email": "brunotop26@gmail.com",
        "age": "28",
        "phone": "21984759575",
        "address": "Rua dois",
        "state": "Minas Gerais",
        "city": "Belo Horizonte"
      }.to_json

      @request = Contato.post('/contacts', body: @body)
      puts @request
  end
end
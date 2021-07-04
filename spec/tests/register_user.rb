describe 'Realizando testes da feature de usuario.' do

  it 'Cadastrar usuário de teste, validando o json schema' do
    @response_create_user = Service.post('/usuarios', body: User.user_body)
    expect(@response_create_user.code).to eq 201
    p schema = JSON.parse(File.read($SCHEMA_JSON_REGISTER))
    JSON::Validator.validate!(schema, @response_create_user.body, strict: true)
  end

  it 'Cria, Pesquisa e Deleta usuario criado' do
    @response_create_user = Service.post('/usuarios', body: User.user_body)
    expect(@response_create_user.code).to eq 201

    result = JSON.parse(@response_create_user.body, object_class: OpenStruct)
    p @response = Service.get("/usuarios/#{result._id}")
    expect(@response.code).to eq 200

    @response = Service.delete("/usuarios/#{result._id}")
    puts @response.body
    expect(@response.code).to eq 200
  end

  it 'Cria, Pesquisa e Altera o usuario criado' do
    @response_create_user = Service.post('/usuarios', body: User.user_body)
    expect(@response_create_user.code).to eq 201

    body_objects = JSON.parse(@response_create_user.body, object_class: OpenStruct)
    p @response_search = Service.get("/usuarios/#{body_objects._id}")
    expect(@response_search.code).to eq 200

    @response = Service.put("/usuarios/#{body_objects._id}", body: User.user_body)
    puts @response.body
    expect(@response.code).to eq 200

    p @response = Service.get("/usuarios/#{body_objects._id}")
    expect(@response.code).to eq 200
  end

  it 'Validar regra de email usado, teste negativo' do
    @body_after = { "nome": User.full_name, "email": User.email, "password": User.password, "administrador": "true" }
    .to_json
    @body_before = { "nome": User.full_name, "email": "rei@gmail.com", "password": User.password, "administrador": "true" }
              .to_json
    @response = Service.post('/usuarios', body: @body_after)
    expect(@response.code).to eq 201

    result = JSON.parse(@response.body, object_class: OpenStruct)
    @response = Service.get("/usuarios/#{result._id}")
    puts @response.body
    expect(@response.code).to eq 200

    @response = Service.put("/usuarios/#{result._id}", body: @body_before)
    puts @response.body
    expect(@response.code).to eq 200

    @response = Service.get("/usuarios/#{result._id}")
    puts @response.body
    expect(@response.code).to eq 200
  end

  it 'Lista usuários cadastrados' do
    @response = Service.get('/usuarios')
    expect(@response.code).to eq 200
  end

end
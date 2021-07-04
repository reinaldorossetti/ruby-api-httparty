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
    p @response_search = Service.get("/usuarios/#{result._id}")
    expect(@response_search.code).to eq 200

    @response_delete = Service.delete("/usuarios/#{result._id}")
    puts @response_delete.body
    expect(@response_delete.code).to eq 200
  end

  it 'Cria, Pesquisa e Altera o usuario criado' do
    @response_create_user = Service.post('/usuarios', body: User.user_body)
    expect(@response_create_user.code).to eq 201

    body_objects = JSON.parse(@response_create_user.body, object_class: OpenStruct)
    p @response_search = Service.get("/usuarios/#{body_objects._id}")
    expect(@response_search.code).to eq 200

    @response_edit = Service.put("/usuarios/#{body_objects._id}", body: User.user_body)
    puts @response_edit.body
    expect(@response_edit.code).to eq 200

    p @response_search = Service.get("/usuarios/#{body_objects._id}")
    expect(@response_search.code).to eq 200
  end

  it 'Validar regra de email usado, teste negativo' do
    @response_create_user = Service.post('/usuarios', body: User.user_body)
    expect(@response_create_user.code).to eq 201

    result = JSON.parse(@response_create_user.body, object_class: OpenStruct)
    @response_search = Service.get("/usuarios/#{result._id}")
    puts @response_search.body
    expect(@response_search.code).to eq 200

    @response_edit = Service.put("/usuarios/#{result._id}", body: User.user_body_email)
    puts @response_edit.body
    expect(@response_edit.code).to eq 200

    @response_search = Service.get("/usuarios/#{result._id}")
    puts @response_search.body
    expect(@response_search.code).to eq 200
  end

  it 'Lista usuários cadastrados' do
    @response_list_user = Service.get('/usuarios')
    expect(@response_list_user.code).to eq 200
  end

end
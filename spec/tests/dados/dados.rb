module User

  define_method(:full_name) { Faker::Name.name }
  define_method(:email) { Faker::Internet.email }
  define_method(:password) { Faker::Internet.password }

  def self.user_body
    { "nome": full_name, "email": email, "password": password, "administrador": "true" }.to_json
  end

  def self.user_body_email
    { "nome": full_name, "email": "rei@gmail.com", "password": password, "administrador": "true" }.to_json
  end


end


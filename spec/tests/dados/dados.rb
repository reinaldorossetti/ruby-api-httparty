module User

  define_method(:full_name) { Faker::Name.name }
  define_method(:email) { Faker::Internet.email }
  define_method(:password) { Faker::Internet.password }

  def self.user_body
    { "nome": full_name, "email": email, "password": password, "administrador": "true" }.to_json
  end

end


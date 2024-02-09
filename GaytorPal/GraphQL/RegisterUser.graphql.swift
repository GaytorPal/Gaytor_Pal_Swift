mutation RegisterUser($registerInput: RegisterInput) {
  registerUser(registerInput: $registerInput) {
    username
    email
    password
    id
  }
}

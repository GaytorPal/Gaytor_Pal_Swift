mutation Login($username: String!, $password: String!) {
  loginUser(username: $username, password: $password) {
    email
    username
    id
  }
}

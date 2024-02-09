// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

extension Gschema {
  struct RegisterInput: InputObject {
    private(set) var __data: InputDict

    init(_ data: InputDict) {
      __data = data
    }

    init(
      username: String,
      password: String,
      confirmPassword: String,
      email: String
    ) {
      __data = InputDict([
        "username": username,
        "password": password,
        "confirmPassword": confirmPassword,
        "email": email
      ])
    }

    var username: String {
      get { __data["username"] }
      set { __data["username"] = newValue }
    }

    var password: String {
      get { __data["password"] }
      set { __data["password"] = newValue }
    }

    var confirmPassword: String {
      get { __data["confirmPassword"] }
      set { __data["confirmPassword"] = newValue }
    }

    var email: String {
      get { __data["email"] }
      set { __data["email"] = newValue }
    }
  }

}
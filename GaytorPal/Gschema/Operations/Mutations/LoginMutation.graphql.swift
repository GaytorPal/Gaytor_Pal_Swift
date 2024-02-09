// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Gschema {
  class LoginMutation: GraphQLMutation {
    static let operationName: String = "Login"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation Login($username: String!, $password: String!) { loginUser(username: $username, password: $password) { __typename email username id } }"#
      ))

    public var username: String
    public var password: String

    public init(
      username: String,
      password: String
    ) {
      self.username = username
      self.password = password
    }

    public var __variables: Variables? { [
      "username": username,
      "password": password
    ] }

    struct Data: Gschema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Gschema.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("loginUser", LoginUser.self, arguments: [
          "username": .variable("username"),
          "password": .variable("password")
        ]),
      ] }

      var loginUser: LoginUser { __data["loginUser"] }

      /// LoginUser
      ///
      /// Parent Type: `User`
      struct LoginUser: Gschema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Gschema.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("email", String.self),
          .field("username", String.self),
          .field("id", Gschema.ID.self),
        ] }

        var email: String { __data["email"] }
        var username: String { __data["username"] }
        var id: Gschema.ID { __data["id"] }
      }
    }
  }

}
// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Gschema {
  class RegisterUserMutation: GraphQLMutation {
    static let operationName: String = "RegisterUser"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation RegisterUser($registerInput: RegisterInput) { registerUser(registerInput: $registerInput) { __typename username email password id } }"#
      ))

    public var registerInput: GraphQLNullable<RegisterInput>

    public init(registerInput: GraphQLNullable<RegisterInput>) {
      self.registerInput = registerInput
    }

    public var __variables: Variables? { ["registerInput": registerInput] }

    struct Data: Gschema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Gschema.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("registerUser", RegisterUser.self, arguments: ["registerInput": .variable("registerInput")]),
      ] }

      var registerUser: RegisterUser { __data["registerUser"] }

      /// RegisterUser
      ///
      /// Parent Type: `User`
      struct RegisterUser: Gschema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Gschema.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("username", String.self),
          .field("email", String.self),
          .field("password", String.self),
          .field("id", Gschema.ID.self),
        ] }

        var username: String { __data["username"] }
        var email: String { __data["email"] }
        var password: String { __data["password"] }
        var id: Gschema.ID { __data["id"] }
      }
    }
  }

}
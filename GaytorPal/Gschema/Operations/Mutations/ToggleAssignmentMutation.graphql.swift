// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Gschema {
  class ToggleAssignmentMutation: GraphQLMutation {
    static let operationName: String = "ToggleAssignment"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation ToggleAssignment($targetId: ID!, $userId: ID!) { toggleCompleted(target_id: $targetId, user_id: $userId) { __typename username } }"#
      ))

    public var targetId: ID
    public var userId: ID

    public init(
      targetId: ID,
      userId: ID
    ) {
      self.targetId = targetId
      self.userId = userId
    }

    public var __variables: Variables? { [
      "targetId": targetId,
      "userId": userId
    ] }

    struct Data: Gschema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Gschema.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("toggleCompleted", ToggleCompleted.self, arguments: [
          "target_id": .variable("targetId"),
          "user_id": .variable("userId")
        ]),
      ] }

      var toggleCompleted: ToggleCompleted { __data["toggleCompleted"] }

      /// ToggleCompleted
      ///
      /// Parent Type: `User`
      struct ToggleCompleted: Gschema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Gschema.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("username", String.self),
        ] }

        var username: String { __data["username"] }
      }
    }
  }

}
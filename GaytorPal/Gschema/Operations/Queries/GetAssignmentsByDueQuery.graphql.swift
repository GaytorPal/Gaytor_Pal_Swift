// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Gschema {
  class GetAssignmentsByDueQuery: GraphQLQuery {
    static let operationName: String = "GetAssignmentsByDue"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetAssignmentsByDue($targetUsername: String!, $targetDueDate: String!) { getAssignmentsByDue( target_username: $targetUsername target_dueDate: $targetDueDate ) { __typename category description dueDate title completed id } }"#
      ))

    public var targetUsername: String
    public var targetDueDate: String

    public init(
      targetUsername: String,
      targetDueDate: String
    ) {
      self.targetUsername = targetUsername
      self.targetDueDate = targetDueDate
    }

    public var __variables: Variables? { [
      "targetUsername": targetUsername,
      "targetDueDate": targetDueDate
    ] }

    struct Data: Gschema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Gschema.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("getAssignmentsByDue", [GetAssignmentsByDue?].self, arguments: [
          "target_username": .variable("targetUsername"),
          "target_dueDate": .variable("targetDueDate")
        ]),
      ] }

      var getAssignmentsByDue: [GetAssignmentsByDue?] { __data["getAssignmentsByDue"] }

      /// GetAssignmentsByDue
      ///
      /// Parent Type: `Assignment`
      struct GetAssignmentsByDue: Gschema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Gschema.Objects.Assignment }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("category", String.self),
          .field("description", String.self),
          .field("dueDate", String.self),
          .field("title", String.self),
          .field("completed", Bool.self),
          .field("id", Gschema.ID.self),
        ] }

        var category: String { __data["category"] }
        var description: String { __data["description"] }
        var dueDate: String { __data["dueDate"] }
        var title: String { __data["title"] }
        var completed: Bool { __data["completed"] }
        var id: Gschema.ID { __data["id"] }
      }
    }
  }

}
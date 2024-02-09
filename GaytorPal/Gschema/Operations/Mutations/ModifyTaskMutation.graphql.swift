// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Gschema {
  class ModifyTaskMutation: GraphQLMutation {
    static let operationName: String = "ModifyTask"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation ModifyTask($targetId: ID!, $userId: ID!, $title: String, $dueDate: String, $description: String, $category: String, $completed: Boolean) { modifyAssignment( target_id: $targetId user_id: $userId title: $title dueDate: $dueDate description: $description category: $category completed: $completed ) { __typename assignments { __typename category completed description dueDate id title } } }"#
      ))

    public var targetId: ID
    public var userId: ID
    public var title: GraphQLNullable<String>
    public var dueDate: GraphQLNullable<String>
    public var description: GraphQLNullable<String>
    public var category: GraphQLNullable<String>
    public var completed: GraphQLNullable<Bool>

    public init(
      targetId: ID,
      userId: ID,
      title: GraphQLNullable<String>,
      dueDate: GraphQLNullable<String>,
      description: GraphQLNullable<String>,
      category: GraphQLNullable<String>,
      completed: GraphQLNullable<Bool>
    ) {
      self.targetId = targetId
      self.userId = userId
      self.title = title
      self.dueDate = dueDate
      self.description = description
      self.category = category
      self.completed = completed
    }

    public var __variables: Variables? { [
      "targetId": targetId,
      "userId": userId,
      "title": title,
      "dueDate": dueDate,
      "description": description,
      "category": category,
      "completed": completed
    ] }

    struct Data: Gschema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Gschema.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("modifyAssignment", ModifyAssignment.self, arguments: [
          "target_id": .variable("targetId"),
          "user_id": .variable("userId"),
          "title": .variable("title"),
          "dueDate": .variable("dueDate"),
          "description": .variable("description"),
          "category": .variable("category"),
          "completed": .variable("completed")
        ]),
      ] }

      var modifyAssignment: ModifyAssignment { __data["modifyAssignment"] }

      /// ModifyAssignment
      ///
      /// Parent Type: `User`
      struct ModifyAssignment: Gschema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Gschema.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("assignments", [Assignment?]?.self),
        ] }

        var assignments: [Assignment?]? { __data["assignments"] }

        /// ModifyAssignment.Assignment
        ///
        /// Parent Type: `Assignment`
        struct Assignment: Gschema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { Gschema.Objects.Assignment }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("category", String.self),
            .field("completed", Bool.self),
            .field("description", String.self),
            .field("dueDate", String.self),
            .field("id", Gschema.ID.self),
            .field("title", String.self),
          ] }

          var category: String { __data["category"] }
          var completed: Bool { __data["completed"] }
          var description: String { __data["description"] }
          var dueDate: String { __data["dueDate"] }
          var id: Gschema.ID { __data["id"] }
          var title: String { __data["title"] }
        }
      }
    }
  }

}
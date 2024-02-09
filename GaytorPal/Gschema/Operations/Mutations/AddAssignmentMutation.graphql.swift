// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Gschema {
  class AddAssignmentMutation: GraphQLMutation {
    static let operationName: String = "AddAssignment"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation AddAssignment($username: String!, $title: String!, $description: String!, $dueDate: String!, $category: String!) { addAssignment( username: $username title: $title description: $description dueDate: $dueDate category: $category ) { __typename email } }"#
      ))

    public var username: String
    public var title: String
    public var description: String
    public var dueDate: String
    public var category: String

    public init(
      username: String,
      title: String,
      description: String,
      dueDate: String,
      category: String
    ) {
      self.username = username
      self.title = title
      self.description = description
      self.dueDate = dueDate
      self.category = category
    }

    public var __variables: Variables? { [
      "username": username,
      "title": title,
      "description": description,
      "dueDate": dueDate,
      "category": category
    ] }

    struct Data: Gschema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Gschema.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("addAssignment", AddAssignment.self, arguments: [
          "username": .variable("username"),
          "title": .variable("title"),
          "description": .variable("description"),
          "dueDate": .variable("dueDate"),
          "category": .variable("category")
        ]),
      ] }

      var addAssignment: AddAssignment { __data["addAssignment"] }

      /// AddAssignment
      ///
      /// Parent Type: `User`
      struct AddAssignment: Gschema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Gschema.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("email", String.self),
        ] }

        var email: String { __data["email"] }
      }
    }
  }

}
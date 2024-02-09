// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Gschema {
  class GetAllClubsQuery: GraphQLQuery {
    static let operationName: String = "GetAllClubs"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetAllClubs { getClubsWithNames { __typename description club_name category id username } }"#
      ))

    public init() {}

    struct Data: Gschema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Gschema.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("getClubsWithNames", [GetClubsWithName].self),
      ] }

      var getClubsWithNames: [GetClubsWithName] { __data["getClubsWithNames"] }

      /// GetClubsWithName
      ///
      /// Parent Type: `Club`
      struct GetClubsWithName: Gschema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Gschema.Objects.Club }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("description", String.self),
          .field("club_name", String?.self),
          .field("category", [String?].self),
          .field("id", Gschema.ID.self),
          .field("username", String.self),
        ] }

        var description: String { __data["description"] }
        var club_name: String? { __data["club_name"] }
        var category: [String?] { __data["category"] }
        var id: Gschema.ID { __data["id"] }
        var username: String { __data["username"] }
      }
    }
  }

}
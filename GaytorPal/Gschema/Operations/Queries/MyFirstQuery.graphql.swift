// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension Gschema {
  class MyFirstQuery: GraphQLQuery {
    static let operationName: String = "MyFirstQuery"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query MyFirstQuery { getClubs { __typename email events { __typename title description } } }"#
      ))

    public init() {}

    struct Data: Gschema.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: ApolloAPI.ParentType { Gschema.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("getClubs", [GetClub].self),
      ] }

      var getClubs: [GetClub] { __data["getClubs"] }

      /// GetClub
      ///
      /// Parent Type: `Club`
      struct GetClub: Gschema.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: ApolloAPI.ParentType { Gschema.Objects.Club }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("email", String.self),
          .field("events", [Event?]?.self),
        ] }

        var email: String { __data["email"] }
        var events: [Event?]? { __data["events"] }

        /// GetClub.Event
        ///
        /// Parent Type: `Event`
        struct Event: Gschema.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: ApolloAPI.ParentType { Gschema.Objects.Event }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("title", String.self),
            .field("description", String.self),
          ] }

          var title: String { __data["title"] }
          var description: String { __data["description"] }
        }
      }
    }
  }

}
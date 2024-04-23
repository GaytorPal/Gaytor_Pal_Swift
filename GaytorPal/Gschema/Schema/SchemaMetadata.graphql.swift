// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol Gschema_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == Gschema.SchemaMetadata {}

protocol Gschema_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == Gschema.SchemaMetadata {}

protocol Gschema_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == Gschema.SchemaMetadata {}

protocol Gschema_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == Gschema.SchemaMetadata {}

extension Gschema {
  typealias ID = String

  typealias SelectionSet = Gschema_SelectionSet

  typealias InlineFragment = Gschema_InlineFragment

  typealias MutableSelectionSet = Gschema_MutableSelectionSet

  typealias MutableInlineFragment = Gschema_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Query": return Gschema.Objects.Query
      case "Club": return Gschema.Objects.Club
      case "Event": return Gschema.Objects.Event
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}
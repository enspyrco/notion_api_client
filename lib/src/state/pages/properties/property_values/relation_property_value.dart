part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#relation-property-values
/// https://developers.notion.com/reference/property-item-object#relation-property-values

/// Relation property value objects contain an array of page references within the relation property.
/// A page reference is an object with an id key and a string value (UUIDv4) corresponding to a page ID in another database.
class RelationPropertyValue extends PropertyValue {
  RelationPropertyValue({required this.references, this.hasMore});

  final List<PageReference> references;

  /// A relation includes a has_more property in the Retrieve a page endpoint response object. The endpoint returns a maximum of 25 page references for a relation. If a relation has more than 25 references, then the has_more value for the relation in the response object is true. If a relation doesn’t exceed the limit, then has_more is false.
  final bool? hasMore;

  factory RelationPropertyValue.fromJson(JsonMap json) => RelationPropertyValue(
        references: (json['references'] as JsonList)
            .map<PageReference>((e) => PageReference.fromJson(e as JsonMap))
            .toList(),
      );
}

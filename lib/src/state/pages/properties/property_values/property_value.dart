library property_value;

import 'package:api_client_utils/types.dart';

import '../../../../exceptions.dart';
import '../../../common/file_object.dart';
import '../../../common/page_reference.dart';
import '../../../rich_text/rich_text.dart';
import '../../../users/user.dart';
part 'checkbox_property_value.dart';
part 'created_by_property_value.dart';
part 'created_time_property_value.dart';
part 'date_property_value.dart';
part 'email_property_value.dart';
part 'files_property_value.dart';
part 'formula_property_value.dart';
part 'last_edited_by_property_value.dart';
part 'last_edited_time_property_value.dart';
part 'multiselect_propert_value.dart';
part 'number_property_value.dart';
part 'people_property_value.dart';
part 'phone_number_property_value.dart';
part 'relation_property_value.dart';
part 'rich_text_property_value.dart';
part 'rollup_property_value.dart';
part 'select_property_value.dart';
part 'status_property_value.dart';
part 'title_property_value.dart';
part 'url_property_value.dart';

/// **Page Property**
/// https://developers.notion.com/reference/page-property-values
/// A page object is made up of page properties, each containing one or more property values.
///
/// **Property Values**
/// https://developers.notion.com/reference/property-value-object
/// Each page property contains 'id' and 'type' keys, as well as a *key* which
/// is the same as the 'type' *value*, eg. {'type': 'rich_text', 'rich_text': ...}
/// This value is the 'property value' and is an object containing type-specific data.
sealed class PropertyValue {
  const PropertyValue();

  factory PropertyValue.fromJson(JsonMap json) {
    return switch (json['type']) {
      'checkbox' => CheckboxPropertyValue.fromJson(json['checkbox'] as JsonMap),
      'created_by' =>
        CreatedByPropertyValue.fromJson(json['created_by'] as JsonMap),
      'created_time' =>
        CreatedTimePropertyValue.fromJson(json['created_time'] as String),
      'date' => DatePropertyValue.fromJson(json['date'] as JsonMap),
      'email' => EmailPropertyValue.fromJson(json['email'] as String),
      'files' => FilesPropertyValue.fromJson(json['files'] as JsonList),
      'formula' => FormulaPropertyValue.fromJson(json['formula'] as JsonMap),
      'last_edited_by' =>
        LastEditedByPropertyValue.fromJson(json['last_edited_by'] as JsonMap),
      'last_edited_time' => LastEditedTimePropertyValue.fromJson(
          json['last_edited_time'] as String),
      'multi_select' =>
        MultiSelectPropertyValue.fromJson(json['multi_select'] as JsonList),
      'number' => NumberPropertyValue.fromJson(json['number'] as num),
      'people' => PeoplePropertyValue.fromJson(json['people'] as JsonList),
      'phone_number' =>
        PhoneNumberPropertyValue.fromJson(json['phone_number'] as String),
      'relation' => RelationPropertyValue.fromJson(json['relation'] as JsonMap),
      'rollup' => RollupPropertyValue.fromJson(json['rollup'] as JsonMap),
      'rich_text' =>
        RichTextPropertyValue.fromJson(json['rich_text'] as JsonList),
      'select' => SelectPropertyValue.fromJson(json['select'] as JsonMap),
      'status' => StatusPropertyValue.fromJson(json['status'] as JsonMap),
      'title' => TitlePropertyValue.fromJson(json['title'] as JsonList),
      'url' => UrlPropertyValue.fromJson(json['url'] as String),
      _ => throw UnrecognizedTypeInJsonException(
          'PropertyValueObject.fromJson', json['type'], json)
    };
  }
}

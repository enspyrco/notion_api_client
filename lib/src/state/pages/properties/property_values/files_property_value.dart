part of 'property_value.dart';

/// https://developers.notion.com/reference/property-value-object#files-property-values
/// https://developers.notion.com/reference/property-item-object#files-property-values

/// File property value objects contain an array of file references within the files property.
/// A file reference is an object with a File Object and name property,
/// with a string value corresponding to a filename of the original file upload
/// (i.e. "Whole_Earth_Catalog.jpg").
class FilesPropertyValue extends PropertyValue {
  const FilesPropertyValue({required this.files});

  ///
  final List<FileObject> files;

  FilesPropertyValue.fromJson(JsonList json)
      : this(
          files: json
              .map<FileObject>((e) => FileObject.fromJson(e as JsonMap))
              .toList(),
        );
}

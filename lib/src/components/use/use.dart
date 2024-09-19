import 'package:jaspr/jaspr.dart';

Component use(
    {required String href,
    List<Component>? children,
    Key? key,
    String? id,
    String? classes,
    Styles? styles,
    Map<String, String>? attributes,
    Map<String, EventCallback>? events}) {
  return DomComponent(
    tag: 'use',
    key: key,
    id: id,
    classes: classes,
    styles: styles,
    attributes: {
      ...attributes ?? {},
      'href': href,
    },
    events: events,
    children: children ?? [],
  );
}
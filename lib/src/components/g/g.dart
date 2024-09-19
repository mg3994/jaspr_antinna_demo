

import 'package:jaspr/jaspr.dart';

Component g(List<Component> children,
    {Key? key,
    String? id,
    String? classes,
    Styles? styles,
    Map<String, String>? attributes,
    Map<String, EventCallback>? events}) {
  return DomComponent(
    tag: 'g',
    key: key,
    id: id,
    classes: classes,
    styles: styles,
    attributes:{
      ...attributes ?? {},
    },
    events: events,
    children: children,
  );
}

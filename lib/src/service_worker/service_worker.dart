import 'package:jaspr/jaspr.dart';
@Import.onWeb('dart:html', show: [#window])
import 'service_worker.imports.dart';

class ServiceWorker extends DomComponent {
  const ServiceWorker.fromJSFile({
    super.tag = 'script',
    super.key,
    super.id,
    super.classes,
    super.styles,
    super.attributes,
    super.events,
    super.child,
    super.children,
  });

  const ServiceWorker({
    super.tag = 'script',
    super.key,
    super.id,
    super.classes,
    super.styles,
    super.attributes,
    super.events,
    super.child,
    super.children,
  });

  @override
  ProxyElement createElement() => DomElement(this);

  void registerServiceWorker() {
    if (window.navigator.serviceWorker != null) {
      window.navigator.serviceWorker
          ?.register('service_worker.js')
          .then((registration) {
        print('Service Worker registered with scope: ${registration.scope}');
      }).catchError((error) {
        print('Service Worker registration failed: $error');
      });
    } else {
      print('Service Workers are not supported.');
    }
  }
}

Component serviceWorker(List<Component> children,
    {bool? async,
    bool? defer,
    required String src,
    Key? key,
    String? id,
    String? classes,
    Styles? styles,
    Map<String, String>? attributes,
    Map<String, EventCallback>? events}) {
  return script(
    key: key,
    id: id,
    classes: classes,
    styles: styles,
    attributes: {
      ...attributes ?? {},
      if (async == true) 'async': '',
      if (defer == true) 'defer': '',
      'src': src,
    },
    events: events,
    src: '',
    children,
  );
}

import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'src/components/header/header.dart';
import 'src/routes/routes.dart';

// The main component of your application.
//
// By using multi-page routing, this component will only be built on the server during pre-rendering and
// **not** executed on the client. Instead only the nested [Home] and [About] components will be mounted on the client.
class WebApp extends StatelessComponent {
  const WebApp({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // This method is rerun every time the component is rebuilt.
    //
    // Each build method can return multiple child components as an [Iterable]. The recommended approach
    // is using the [sync* / yield] syntax for a streamlined control flow, but its also possible to simply
    // create and return a [List] here.

    // Renders a <div class="main"> html element with children.
    yield script(src: 'script.js', [
      div(classes: 'main', [
        Router(
          routes: [
            ShellRoute(
              builder: (context, state, child) => Fragment(
                children: [
                  const Header(),
                  // aside()
                  child,
                  // footer([]),
                ],
              ),
              routes: WebAppRoutes.routes,
            )
            //  Route(path: '/*', builder: (context, state) => Error404()),
          ],
          //  errorBuilder: (context, state) => Error404(),
        ),
      ])
    ]);
  }

  // Defines the css styles for elements of this component.
  //
  // By using the @css annotation, these will be rendered automatically to css inside the <head> of your page.
  // Must be a variable or getter of type [List<StyleRule>].
  @css
  static final styles = [
    css('.main', [
      // The '&' refers to the parent selector of a nested style rules.
      css('&')
          .box(height: 100.vh)
          .flexbox(direction: FlexDirection.column, wrap: FlexWrap.wrap),
      css('section').flexItem(flex: Flex(grow: 1)).flexbox(
            direction: FlexDirection.column,
            justifyContent: JustifyContent.center,
            alignItems: AlignItems.center,
          ),
    ]),
  ];
}

import 'package:jaspr/jaspr.dart';

class AppStyles {
  static List<StyleRule> get styles => [
        // Special import rule to include to another css file.
        css.import('https://fonts.googleapis.com/css?family=Roboto'),
        // Each style rule takes a valid css selector and a set of styles.
        // Styles are defined using type-safe css bindings and can be freely chained and nested.
        css('html, body')
            .text(
                fontFamily: const FontFamily.list(
                    [FontFamily('Roboto'), FontFamilies.sansSerif]))
            .box(width: 100.percent, minHeight: 100.vh)
            .box(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
        css('h1').text(fontSize: 4.rem).box(margin: EdgeInsets.unset),
      ];
}

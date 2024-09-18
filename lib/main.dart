// The entrypoint for the **server** environment.
//
// The [main] method will only be executed on the server during pre-rendering.
// To run code on the client, use the @client annotation.

// Server-specific jaspr import.
import 'package:antinna/src/constants/theme.dart';
import 'package:jaspr/server.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'jaspr_options.dart';
import 'src/components/service_worker/service_worker.dart';
import 'src/styles/style.dart';
// Imports the [App] component.
import 'web_app.dart';

// @Import.onweb()

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultJasprOptions,
  );
  ServiceWorker();

  // Starts the app.
  //
  // [Document] renders the root document structure (<html>, <head> and <body>)
  // with the provided parameters and components.
  runApp(Document(
    title: 'Antinna',
    base:
        baseHref, //comment me if https://<username>.github.io else if http://<username>.github.io/<repository> change the repository with base
    styles: AppStyles.styles,
    head: [
      // The generated flutter manifest.
      link(rel: 'manifest', href: 'manifest.json'),
      // Inline script to register the service worker

      // Add your service worker script here
      script([], src: 'script.js'),
      script([], src: 'service_worker.js'),
    ],
    body: const WebApp(),
  ));
}

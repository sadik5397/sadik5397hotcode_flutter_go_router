import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

GoRouter _router = GoRouter(routes: [
  ShellRoute(
      builder: (context, state, child) => Scaffold(
            body: child,
            bottomNavigationBar: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => context.go('/'), child: const Text('Home')),
                ElevatedButton(onPressed: () => context.go('/details'), child: const Text('Details')),
                ElevatedButton(onPressed: () => context.go('/manage'), child: const Text('Manage')),
                ElevatedButton(onPressed: () => context.go('/sadik/basl'), child: const Text('Sadik')),
                ElevatedButton(onPressed: () => context.go('/query'), child: const Text('Query')),
                ElevatedButton(onPressed: () => context.go('/debug/আগাছা'), child: const Text('Debug')),
              ],
            ),
          ),
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomeScreen(), routes: [
          GoRoute(path: 'details', builder: (context, state) => const DetailsScreen()),
          GoRoute(path: 'manage', builder: (context, state) => const ManageScreen()),
          GoRoute(path: 'sadik/:id', builder: (context, state) => SadikScreen(id: state.pathParameters['id'])),
          GoRoute(path: 'query', builder: (context, state) => QueryScreen(name: state.uri.queryParameters['name'])),
          GoRoute(path: 'debug/:id', builder: (context, state) => DebugScreen(value: state.uri.queryParameters['value'], id: state.pathParameters['id'])),
        ])
      ])
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(debugShowCheckedModeBanner: false, routerConfig: _router);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home Screen')),
        body: Center(
            child: ElevatedButton(
          onPressed: () => context.go('/details'),
          child: const Text('Go to the Details screen'),
        )));
  }
}

class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go back to the Home screen'),
        ),
      ),
    );
  }
}

class ManageScreen extends StatelessWidget {
  const ManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('manage Screen id')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go back to the Home screen'),
        ),
      ),
    );
  }
}

class SadikScreen extends StatelessWidget {
  const SadikScreen({super.key, this.id});

  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sadik Screen id: $id')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go back to the Home screen'),
        ),
      ),
    );
  }
}

class QueryScreen extends StatelessWidget {
  const QueryScreen({super.key, this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Query Screen name: $name')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go back to the Home screen'),
        ),
      ),
    );
  }
}

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key, this.value, this.id});

  final String? value;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Debug Screen value: $value, id: $id')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go back to the Home screen'),
        ),
      ),
    );
  }
}

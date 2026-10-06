import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clientforge_app/app/app.dart';

void main() {
  testWidgets('App initializes successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: ClientForgeApp(),
      ),
    );
    expect(find.text('ClientForge'), findsWidgets);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:barberspace_landing_flutter/main.dart';

void main() {
  testWidgets('Landing page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const BarberSpaceLandingApp());
    expect(find.text('BARBER '), findsWidgets);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:sena_portfolio/main.dart';

void main() {
  testWidgets('Portfolio app renders', (WidgetTester tester) async {
    await tester.pumpWidget(const SenaPortfolioApp());
    expect(find.text('Sena Şahin'), findsWidgets);
  });
}

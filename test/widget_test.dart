import 'package:flutter_test/flutter_test.dart';
import 'package:pawsguard/main.dart';

void main() {
  testWidgets('Splash Screen displays correctly', (WidgetTester tester) async {
    // Uygulamayı başlat
    await tester.pumpWidget(const PawsGuardApp());

    // Splash Screen'deki metinleri kontrol et
    expect(find.text('PawsGuard'), findsOneWidget); // Başlık
    expect(find.text('Dostlarımız için en güzel hayat'), findsOneWidget); // Alt başlık

    // Butonları kontrol et
    expect(find.text('Get Start'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}

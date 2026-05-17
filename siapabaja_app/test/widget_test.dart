import 'package:flutter_test/flutter_test.dart';
import 'package:siapabaja_app/main.dart'; // Sesuaikan dengan nama projectmu

void main() {
  testWidgets('Cek tampilan awal SIAPABAJA', (WidgetTester tester) async {
    // Build aplikasi kita
    await tester.pumpWidget(const SiapabajaApp());

    // Verifikasi bahwa teks SIAPABAJA muncul di Splash Screen
    expect(find.text('SIAPABAJA'), findsWidgets);
  });
}
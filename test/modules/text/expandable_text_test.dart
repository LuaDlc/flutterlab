import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterlab/l10n/app_localizations.dart';
import 'package:flutterlab/modules/text/widgets/expandable_text.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  const longText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
      'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.';

  Widget createWidgetUnderTest() {
    return MaterialApp(
      locale: const Locale('en'),
      supportedLocales: const [Locale('en'), Locale('pt'), Locale('es')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: ExpandableText(text: longText, maxLines: 2),
        ),
      ),
    );
  }

  testWidgets('shows Read more when text overflows', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.text('Read more'), findsOneWidget);
  });

  testWidgets('expands text when tapping Read more', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Read more'));
    await tester.pumpAndSettle();

    expect(find.text('Read less'), findsOneWidget);
  });

  testWidgets('collapses text when tapping Read less', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Read more'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Read less'));
    await tester.pumpAndSettle();

    expect(find.text('Read more'), findsOneWidget);
  });
}

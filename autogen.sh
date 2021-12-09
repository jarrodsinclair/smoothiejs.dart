# auto-generate the Dart code

# download Smoothie Charts 1.36.0 TypeScript type definition
wget -qO smoothie.d.ts https://raw.githubusercontent.com/joewalnes/smoothie/1.36.0/smoothie.d.ts
dart_js_facade_gen smoothie.d.ts > lib/smoothiejs.dart
rm -rf smoothie.d.ts

# rename classes
sed -i '' 's/library smoothie;/library smoothiejs;/g' lib/smoothiejs.dart
sed -i '' 's/IChart/Chart/g' lib/smoothiejs.dart
sed -i '' 's/IGrid/Grid/g' lib/smoothiejs.dart
sed -i '' 's/IHorizontal/Horizontal/g' lib/smoothiejs.dart
sed -i '' 's/ILabel/Label/g' lib/smoothiejs.dart
sed -i '' 's/IRange/Range/g' lib/smoothiejs.dart
sed -i '' 's/ITime/Time/g' lib/smoothiejs.dart
sed -i '' 's/ITitle/Title/g' lib/smoothiejs.dart
sed -i '' 's/HTMLCanvasElement/CanvasElement/g' lib/smoothiejs.dart
sed -i '' 's/Date/DateTime/g' lib/smoothiejs.dart
sed -i '' 's/TimeSeries.fakeConstructor$();//g' lib/smoothiejs.dart
sed -i '' 's/SmoothieChart.fakeConstructor$();//g' lib/smoothiejs.dart
sed -i '' 's/import "package:js\/js.dart";/import "dart:html" show CanvasElement;\nimport "package:js\/js.dart";/g' lib/smoothiejs.dart

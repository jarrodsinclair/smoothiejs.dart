# auto-generate the Dart code

# download Smoothie Charts 1.34.0 TypeScript type definition
wget -qO smoothie.d.ts https://raw.githubusercontent.com/joewalnes/smoothie/327c79402c4250211f11ed5136576a7fb8a44344/smoothie.d.ts
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
sed -i '' 's/ITime/Time/g' lib/smoothiejs.dart

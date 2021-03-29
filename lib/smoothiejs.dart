@JS()
library smoothiejs;

import "dart:html" show CanvasElement;
import "package:js/js.dart";

import 'src/func.dart';

/// Type definitions for Smoothie Charts 1.34
/// Project: https://github.com/joewalnes/smoothie
/// Definitions by: Drew Noakes <https://drewnoakes.com>
/// Mike H. Hawley <https://github.com/mikehhawley>
/// Definitions: https://github.com/borisyankov/DefinitelyTyped/smoothie
@anonymous
@JS()
abstract class TimeSeriesOptions {
  external bool get resetBounds;
  external set resetBounds(bool v);
  external num get resetBoundsInterval;
  external set resetBoundsInterval(num v);
  external factory TimeSeriesOptions(
      {bool resetBounds, num resetBoundsInterval});
}

@anonymous
@JS()
abstract class TimeSeriesPresentationOptions {
  external String get strokeStyle;
  external set strokeStyle(String v);
  external String get fillStyle;
  external set fillStyle(String v);
  external num get lineWidth;
  external set lineWidth(num v);
  external factory TimeSeriesPresentationOptions(
      {String strokeStyle, String fillStyle, num lineWidth});
}

@JS()
class TimeSeries {
  // @Ignore
  external TimeSeries.fakeConstructor$();

  /// Initialises a new <code>TimeSeries</code> with optional data options.
  /// Options are of the form (defaults shown):
  /// <pre>
  /// {
  /// resetBounds: true,        // enables/disables automatic scaling of the y-axis
  /// resetBoundsInterval: 3000 // the period between scaling calculations, in millis
  /// }
  /// </pre>
  /// Presentation options for TimeSeries are specified as an argument to <code>SmoothieChart.addTimeSeries</code>.
  external factory TimeSeries([TimeSeriesOptions options]);

  /// Adjust or inspect the lower y-axis for this <code>TimeSeries</code> object.
  external num get minValue;
  external set minValue(num v);

  /// Adjust or inspect the upper y-axis for this <code>TimeSeries</code> object.
  external num get maxValue;
  external set maxValue(num v);

  /// Hide this <code>TimeSeries</code> object in the chart.
  external bool get disabled;
  external set disabled(bool v);

  /// Clears all data and state from this TimeSeries object.
  external void clear();

  /// Recalculate the min/max values for this <code>TimeSeries</code> object.
  /// This causes the graph to scale itself in the y-axis.
  external void resetBounds();

  /// Adds a new data point to the <code>TimeSeries</code>, preserving chronological order.
  /// whether it is replaced, or the values summed (defaults to false.)
  external void append(num timestamp, num value,
      [bool sumRepeatedTimeStampValues]);
  external void dropOldData(num oldestValidTime, num maxDataSetLength);
}

@anonymous
@JS()
abstract class GridOptions {
  /// The background colour of the chart.
  external String get fillStyle;
  external set fillStyle(String v);

  /// The pixel width of grid lines.
  external num get lineWidth;
  external set lineWidth(num v);

  /// Colour of grid lines.
  external String get strokeStyle;
  external set strokeStyle(String v);

  /// Distance between vertical grid lines.
  external num get millisPerLine;
  external set millisPerLine(num v);

  /// Controls whether grid lines are 1px sharp, or softened.
  external bool get sharpLines;
  external set sharpLines(bool v);

  /// Number of vertical sections marked out by horizontal grid lines.
  external num get verticalSections;
  external set verticalSections(num v);

  /// Whether the grid lines trace the border of the chart or not.
  external bool get borderVisible;
  external set borderVisible(bool v);
  external factory GridOptions(
      {String fillStyle,
      num lineWidth,
      String strokeStyle,
      num millisPerLine,
      bool sharpLines,
      num verticalSections,
      bool borderVisible});
}

@anonymous
@JS()
abstract class LabelOptions {
  /// Enables/disables labels showing the min/max values.
  external bool get disabled;
  external set disabled(bool v);

  /// Colour for text of labels.
  external String get fillStyle;
  external set fillStyle(String v);
  external num get fontSize;
  external set fontSize(num v);
  external String get fontFamily;
  external set fontFamily(String v);
  external num get precision;
  external set precision(num v);

  /// Shows intermediate labels between min and max values along y axis.
  external bool get showIntermediateLabels;
  external set showIntermediateLabels(bool v);
  external bool get intermediateLabelSameAxis;
  external set intermediateLabelSameAxis(bool v);
  external factory LabelOptions(
      {bool disabled,
      String fillStyle,
      num fontSize,
      String fontFamily,
      num precision,
      bool showIntermediateLabels,
      bool intermediateLabelSameAxis});
}

@anonymous
@JS()
abstract class Range {
  external num get min;
  external set min(num v);
  external num get max;
  external set max(num v);
  external factory Range({num min, num max});
}

@anonymous
@JS()
abstract class HorizontalLine {
  external num get value;
  external set value(num v);
  external String get color;
  external set color(String v);
  external num get lineWidth;
  external set lineWidth(num v);
  external factory HorizontalLine({num value, String color, num lineWidth});
}

@anonymous
@JS()
abstract class ChartOptions {
  /// Specify to clamp the lower y-axis to a given value.
  external num get minValue;
  external set minValue(num v);

  /// Specify to clamp the upper y-axis to a given value.
  external num get maxValue;
  external set maxValue(num v);

  /// Allows proportional padding to be added above the chart. For 10% padding, specify 1.1.
  external num get minValueScale;
  external set minValueScale(num v);

  /// Allows proportional padding to be added below the chart. For 10% padding, specify 1.1.
  external num get maxValueScale;
  external set maxValueScale(num v);
  external Func1<Range, Range> get yRangeFunction;
  external set yRangeFunction(Func1<Range, Range> v);

  /// Controls the rate at which y-value zoom animation occurs.
  external num get scaleSmoothing;
  external set scaleSmoothing(num v);

  /// Sets the speed at which the chart pans by.
  external num get millisPerPixel;
  external set millisPerPixel(num v);

  /// Whether to render at different DPI depending upon the device. Enabled by default.
  external bool get enableDpiScaling;
  external set enableDpiScaling(bool v);

  /// Callback function that formats the min y value label
  external Func2<num, num, String> get yMinFormatter;
  external set yMinFormatter(Func2<num, num, String> v);

  /// Callback function that formats the max y value label
  external Func2<num, num, String> get yMaxFormatter;
  external set yMaxFormatter(Func2<num, num, String> v);

  /// Callback function that formats the intermediate y value labels
  external Func2<num, num, String> get yIntermediateFormatter;
  external set yIntermediateFormatter(Func2<num, num, String> v);
  external num get maxDataSetLength;
  external set maxDataSetLength(num v);

  /// Controls how lines are drawn between data points. Defaults to "bezier".
  external String /*'linear'|'step'|'bezier'*/ get interpolation;
  external set interpolation(String /*'linear'|'step'|'bezier'*/ v);

  /// Optional function to format time stamps for bottom of chart. You may use <code>SmoothieChart.timeFormatter</code>, or your own/
  external Func1<DateTime, String> get timestampFormatter;
  external set timestampFormatter(Func1<DateTime, String> v);
  external List<HorizontalLine> get horizontalLines;
  external set horizontalLines(List<HorizontalLine> v);
  external GridOptions get grid;
  external set grid(GridOptions v);
  external LabelOptions get labels;
  external set labels(LabelOptions v);
  external bool get tooltip;
  external set tooltip(bool v);
  external dynamic /*{ lineWidth: number, strokeStyle: string }*/ get tooltipLine;
  external set tooltipLine(
      dynamic /*{ lineWidth: number, strokeStyle: string }*/ v);
  external Func2<
      num,
      List<dynamic /*{series: TimeSeries, index: number, value: number}*/ >,
      String> get tooltipFormatter;
  external set tooltipFormatter(
      Func2<
              num,
              List<
                  dynamic /*{series: TimeSeries, index: number, value: number}*/ >,
              String>
          v);

  /// Whether to use time of latest data as current time.
  external bool get nonRealtimeData;
  external set nonRealtimeData(bool v);

  /// Displays not the latest data, but data from the given percentile.
  /// Useful when trying to see old data saved by setting a high value for maxDataSetLength.
  /// Should be a value between 0 and 1.
  external num get displayDataFromPercentile;
  external set displayDataFromPercentile(num v);

  /// Allows the chart to stretch according to its containers and layout settings. Default is <code>false</code>, for backwards compatibility.
  external bool get responsive;
  external set responsive(bool v);

  /// The maximum frame rate the chart will render at, in FPS. Default is <code>0</code>, meaning no limit.
  external num get limitFPS;
  external set limitFPS(num v);
  external factory ChartOptions(
      {num minValue,
      num maxValue,
      num minValueScale,
      num maxValueScale,
      Func1<Range, Range> yRangeFunction,
      num scaleSmoothing,
      num millisPerPixel,
      bool enableDpiScaling,
      Func2<num, num, String> yMinFormatter,
      Func2<num, num, String> yMaxFormatter,
      Func2<num, num, String> yIntermediateFormatter,
      num maxDataSetLength,
      String /*'linear'|'step'|'bezier'*/ interpolation,
      Func1<DateTime, String> timestampFormatter,
      List<HorizontalLine> horizontalLines,
      GridOptions grid,
      LabelOptions labels,
      bool tooltip,
      dynamic /*{ lineWidth: number, strokeStyle: string }*/ tooltipLine,
      Func2<
              num,
              List<
                  dynamic /*{series: TimeSeries, index: number, value: number}*/ >,
              String>
          tooltipFormatter,
      bool nonRealtimeData,
      num displayDataFromPercentile,
      bool responsive,
      num limitFPS});
}

/// Initialises a new <code>SmoothieChart</code>.
/// Options are optional and may be sparsely populated. Just specify the values you
/// need and the rest will be given sensible defaults.
@JS()
class SmoothieChart {
  // @Ignore
  external SmoothieChart.fakeConstructor$();
  external factory SmoothieChart([ChartOptions chartOptions]);

  /// Change or inspect presentation options.
  external ChartOptions get options;
  external set options(ChartOptions v);

  /// Adds a <code>TimeSeries</code> to this chart, with optional presentation options.
  external void addTimeSeries(TimeSeries series,
      [TimeSeriesPresentationOptions seriesOptions]);

  /// Removes the specified <code>TimeSeries</code> from the chart.
  external void removeTimeSeries(TimeSeries series);

  /// Gets render options for the specified <code>TimeSeries</code>.
  /// As you may use a single <code>TimeSeries</code> in multiple charts with different formatting in each usage,
  /// these settings are stored in the chart.
  external TimeSeriesPresentationOptions getTimeSeriesOptions(
      TimeSeries timeSeries);

  /// Brings the specified <code>TimeSeries</code> to the top of the chart. It will be rendered last.
  external void bringToFront(TimeSeries timeSeries);

  /// Instructs the <code>SmoothieChart</code> to start rendering to the provided canvas, with specified delay.
  /// from appearing on screen, with new values flashing into view, at the expense of some latency.
  external void streamTo(CanvasElement canvas, [num delayMillis]);

  /// Starts the animation of this chart. Called by <code>streamTo</code>.
  external void start();

  /// Stops the animation of this chart.
  external void stop();
  external void updateValueRange();
  external void render([CanvasElement canvas, num time]);
  external static String timeFormatter(DateTime date);
}

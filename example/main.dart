import 'dart:async';
import 'dart:html';
import 'dart:math' as math;

import 'package:smoothiejs/smoothiejs.dart';

void createUpdatingChart(String label, TimeSeries ts) {
  // create chart object
  var c = SmoothieChart(ChartOptions(
    //limitFPS: 5,
    //enableDpiScaling: false,
    interpolation: 'linear',
    millisPerPixel: 100,
    grid: new GridOptions(
      millisPerLine: 0,
      lineWidth: 0,
      verticalSections: 0,
      //fillStyle: '#ffffff',
    ),
    labels: new LabelOptions(
      disabled: true,
    ),
  ));

  // link in the time-series object as a dataset
  // (behaves similar to a stream)
  c.addTimeSeries(
    ts,
    new TimeSeriesPresentationOptions(
      strokeStyle: 'rgba(255, 0, 0, 1)',
      lineWidth: 2,
    ),
  );

  // add to the html document
  var el = document.getElementById(label) as CanvasElement;
  c.streamTo(el, 250);

  // add random values to the time-series object periodically
  var rnd = new math.Random();
  new Timer.periodic(
    const Duration(milliseconds: 250),
    (Timer t) {
      ts.append(new DateTime.now().millisecondsSinceEpoch, rnd.nextDouble());
    },
  );
}

void main() {
  createUpdatingChart('canvas0', new TimeSeries());
  createUpdatingChart('canvas1', new TimeSeries());
  createUpdatingChart('canvas2', new TimeSeries());
  createUpdatingChart('canvas3', new TimeSeries());
  createUpdatingChart('canvas4', new TimeSeries());
}

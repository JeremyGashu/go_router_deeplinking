// ignore_for_file: avoid_print
import 'dart:isolate';

void main() async {
  // like tube between current thread and isolated one
  final receivePort = ReceivePort();
  await Isolate.spawn(
    runCalculation,
    receivePort.sendPort,
    debugName: "Isolate Testing",
  );

  // listening to the tube - getting data from isolate
  receivePort.listen((message) {
    if (message is int) {
      print('Calculation result: $message');
    }
  });
}

void runCalculation(SendPort sendPort) {
  final result = performCalculation();
  sendPort.send(result);
}

int performCalculation() {
  return 42;
}

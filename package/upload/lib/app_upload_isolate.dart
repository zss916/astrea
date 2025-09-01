import 'dart:io';
import 'dart:isolate';

class AppUploadIsolate {
  Future<int> loadData(String url, String localPath) async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);
    SendPort sendPort = await receivePort.first;
    int dataList = await sendReceive(sendPort, url, localPath, "image/jpeg");
    return dataList;
  }

  static dataLoader(SendPort sendPort) async {
    ReceivePort receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    await for (var msg in receivePort) {
      SendPort callbackPort = msg[0];
      String requestURL = msg[1];
      String localPath = msg[2];
      String contentType = msg[3];
      var req = await HttpClient().putUrl(Uri.parse(requestURL));
      req.headers.add('Content-Type', contentType);
      req.headers.add('Accept', '*/*');
      req.headers.add('Connection', 'keep-alive');
      req.bufferOutput = true;
      var file = File(localPath);
      var s = await file.open();
      var x = 0;
      var size = file.lengthSync();
      req.headers.add('Content-Length', size.toString());
      var chunkSize = 65536;
      while (x < size) {
        var _len = size - x >= chunkSize ? chunkSize : size - x;
        var val = s.readSync(_len).toList();
        x = x + _len;
        req.add(val);
        await req.flush();
      }
      await s.close();
      await req.close();
      final response = await req.done;
      callbackPort.send(response.statusCode);
    }
  }

  Future sendReceive(
    SendPort sendPort,
    String url,
    String localPath,
    String contentType,
  ) {
    ReceivePort receivePort = ReceivePort();
    sendPort.send([receivePort.sendPort, url, localPath, contentType]);
    return receivePort.first;
  }
}

// Copyright (c) 2017, TOPdesk. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

part of '../api/bot.dart';

Stream<Update> _pollForUpdates(
  TelegramBot telegrambot,
  UpdateTracker updateTracker,
  int timeout,
  int limit,
  Iterable<String> allowedUpdates,
) {
  updateTracker ??= new UpdateTracker();
  StreamController<Update> controller;
  bool paused = false;
  bool canceled = false;

  _start() {
    if (canceled) {
      controller.close();
      return;
    }
    telegrambot
        .sendCommand(new GetUpdates(
      offset: updateTracker.value + 1,
      timeout: timeout,
      limit: limit,
      allowedUpdates: allowedUpdates,
    ))
        .then((updates) {
      for (var u in updates ?? []) {
        if (updateTracker.value < u.updateId) {
          updateTracker.value = u.updateId;
        }
        controller.add(u);
      }
      if (canceled) {
        controller.close();
        return;
      }
      if (!paused) {
        _start();
      }
    });
  }

  _pause() => paused = true;
  _resume() {
    paused = false;
    _start();
  }

  _cancel() {
    canceled = true;
    if (paused) {
      controller.close();
    }
  }

  controller = new StreamController<Update>(
      onListen: _start, onPause: _pause, onResume: _resume, onCancel: _cancel);
  return controller.stream;
}

class _TelegramBot implements TelegramBot {
  final String token;
  final List<Proxy> proxies;
  HttpClient _client = new HttpClient();
  int count = 0;
  _TelegramBot(this.token, {this.proxies = const []}) {
    if (proxies.isNotEmpty) {
      _client.findProxy = (Uri url) {
        Proxy suitableProxy = proxies.firstWhere((Proxy proxy) =>
          Uri.parse(proxy.url).scheme == url.scheme &&
            Uri.parse(proxy.url).host == url.host,
          orElse: null
        );
        if (suitableProxy != null) {
          return HttpClient.findProxyFromEnvironment(
              Uri.parse(suitableProxy.url),
              environment: suitableProxy.toMap()
          );
        }
      };
    }
  }

  @override
  Future<T> sendCommand<T>(Command<T> command) => _process(count++, command);

  Future<T> _process<T>(int id, Command<T> command) async {
    print("sending  #$id: $command");
    var result = await post(
        _client,
        token,
        command.method,
        (command as Serializable).toMap()['data']
    );
    print('received #$id: ${json2string(result)}');
    // TODO: handle error responses
    return command.convert(result['result']);
  }
}

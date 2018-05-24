// Copyright (c) 2017, TOPdesk. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

library bot;

import 'dart:async';
import 'dart:io';
import 'model.dart';
import '../impl/util.dart';

part '../impl/bot.dart';

/// Keeps track of the last received update.
///
/// When the [TelegramBot] asks the [Telegram Bot API][1] if there are updates,
/// it uses the [value]`+ 1` as a starting point.
///
/// Whenever an update is received, the [value] will be set to the last
/// processed update.
///
/// [1]: https://core.telegram.org/bots/api
class UpdateTracker {
  int value = -1;
}

/// Setup the [TelegramBot] in polling mode.
///
/// The TelegramBot will be [polling the Telegram Bot API][1] for updates.
///
/// [1]: https://core.telegram.org/bots/api#getupdates
Stream<Update> pollForUpdates(
  TelegramBot telegramBot, {
  int timeout = 45,
  int limit = null,
  Iterable<String> allowedUpdates = const [],
  UpdateTracker updateTracker,
}) =>
    _pollForUpdates(telegramBot, updateTracker, timeout, limit, allowedUpdates);

/// This TelegramBot talks to the [Telegram Bot API][1].
///
/// You can instruct the TelegramBot to send data to the Telegram servers using
/// [sendCommand]/ See [Command] for the list of available commands.
///
/// If you want to respond to messages, you can use the TelegramBot in polling
/// mode or in webhook mode.
///
/// For polling mode, use [pollForUpdates]/
///
/// [1]: https://core.telegram.org/bots/api#getupdates
abstract class TelegramBot {
  TelegramBot._();

  factory TelegramBot(String token, {List<Proxy> proxies}) = _TelegramBot;

  Future<T> sendCommand<T>(Command<T> command);
}

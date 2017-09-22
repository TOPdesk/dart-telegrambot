// Copyright (c) 2017, TOPdesk. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'package:telegrambot/telegrambot.dart';

Future<dynamic> main(List<String> args) async {
  if (args.length != 1) {
    print('Usage: example <token>');
    exit(-1);
  }
  var token = args[0];
  var bot = new TelegramBot(token);

  var updates = pollForUpdates(bot);

  await for (var update in updates) {
    if (update.inlineQuery != null) {
      handleInlineQuery(bot, update.inlineQuery);
    }
    if (update.message != null) {
      handleMessage(bot, update.message);
    }
  }
}

void handleMessage(TelegramBot bot, Message message) {
  bot.sendCommand(new SendMessage.plainText(message.chat.id,
      "Hello, I'm just a bot. Don't expect too much from me."));
}

const _pageSize = 10;

void handleInlineQuery(TelegramBot bot, InlineQuery inlineQuery) {
  var offset =
      (inlineQuery.offset ?? '').isEmpty ? 0 : int.parse(inlineQuery.offset);

  var results = <InlineQueryResult>[];
  var i = offset;
  for (; i < inlineQuery.query.runes.length && i - offset < _pageSize; i++) {
    results.add(
      new InlineQueryResultArticle(
          '$i',
          'At least ${i+1}',
          new InputTextMessageContent.markdown(
              'The sent text contains _at least_ ${i+1} characters.')),
    );
  }
  var nextOffset = i < inlineQuery.query.length ? '$i' : null;
  bot.sendCommand(new AnswerInlineQuery(
    inlineQuery.id,
    results,
    nextOffset: nextOffset,
    switchPmText: 'Chat with me',
    switchPmParameter: 'chat',
  ));
}

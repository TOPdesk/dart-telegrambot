Telegram Bot
============

* [Introduction](#introduction)
* [Example](#example)
* [Features](#features)
* [Missing Features](#missing-features)
* [License and contributors](#license-and-contributors)

Introduction
------------

Library to implement a Telegram Bot.

Example
-------

```dart
var bot = new TelegramBot('<token>');

var updates = pollForUpdates(bot);

await for (var update in updates) {
  if (update.message != null) {
      bot.sendCommand(new SendMessage.plainText(update.message.chat.id,
          "Hello, I'm just a bot. Don't expect too much from me."));
  }
}

```

Features
--------
* Poll for incoming messages
* Sending text messages
  * Plaintext, html, markdown
  * Reply, Forward
  * Keyboards
* Inline bot
  * Reply with text
  * Reply with GIF
  * Support for InlineKeyboard

Missing Features
----------------
* Webhooks
* Audio/Video/Files/Photos
* Chat Management
* Games
* Payments
* Framework
  * Logging
  * Error handling
  * Strong validation

License and contributors
------------------------

* The MIT License, see [LICENSE](https://github.com/TOPdesk/dart-telegrambot/raw/master/LICENSE).
* For contributors, see [AUTHORS](https://github.com/TOPdesk/dart-telegrambot/raw/master/AUTHORS).

// Copyright (c) 2017, TOPdesk. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

part of '../api/model.dart';

class _Update extends Serializable implements Update {
  final int updateId;
  final _Message message;
  final _Message editedMessage;
  final _Message channelPost;
  final _Message editedChannelPost;
  final _InlineQuery inlineQuery;
  final _ChosenInlineResult chosenInlineResult;
  final _CallbackQuery callbackQuery;
  final _ShippingQuery shippingQuery;
  final _PreCheckoutQuery preCheckoutQuery;

  _Update(
    this.updateId, {
    Message message,
    Message editedMessage,
    Message channelPost,
    Message editedChannelPost,
    InlineQuery inlineQuery,
    ChosenInlineResult chosenInlineResult,
    CallbackQuery callbackQuery,
    ShippingQuery shippingQuery,
    PreCheckoutQuery preCheckoutQuery,
  })
      : this.message = message as _Message,
        this.editedMessage = editedMessage as _Message,
        this.channelPost = channelPost as _Message,
        this.editedChannelPost = editedChannelPost as _Message,
        this.inlineQuery = inlineQuery as _InlineQuery,
        this.chosenInlineResult = chosenInlineResult as _ChosenInlineResult,
        this.callbackQuery = callbackQuery as _CallbackQuery,
        this.shippingQuery = shippingQuery as _ShippingQuery,
        this.preCheckoutQuery = preCheckoutQuery as _PreCheckoutQuery;

  static _Update fromMap(Map<String, Object> map) => map == null
      ? null
      : new _Update(map['update_id'],
          message: _Message.fromMap(map['message']),
          editedMessage: _Message.fromMap(map['edited_message']),
          channelPost: _Message.fromMap(map['channel_post']),
          editedChannelPost: _Message.fromMap(map['edited_channel_post']),
          inlineQuery: _InlineQuery.fromMap(map['inline_query']));

  @override
  Map<String, Object> createMap() => noNull({
        'update_id': updateId,
        'message': message?.toMap(),
        'edited_message': editedMessage?.toMap(),
        'channel_post': channelPost?.toMap(),
        'edited_challep_post': editedChannelPost?.toMap(),
        'inline_query': inlineQuery?.toMap(),
        'chosen_inline_result': chosenInlineResult?.toMap(),
        'callback_query': callbackQuery?.toMap(),
        'shipping_query': shippingQuery?.toMap(),
        'pre_checkout_query': preCheckoutQuery?.toMap(),
      });
}

class _GetUpdates extends _Command<List<Update>> implements GetUpdates {
  final int offset;
  final int limit;
  final int timeout;
  final List<String> allowedUpdates;

  _GetUpdates(
      {this.offset,
        this.limit,
        this.timeout,
        Iterable<String> allowedUpdates = const []})
      : this.allowedUpdates = copyList(allowedUpdates),
        super._(
          'getUpdates', (lst) => copyList(mapOrNull(lst, _Update.fromMap)));

  @override
  Map<String, Object> get data => noNull({
    'offset': offset,
    'limit': limit,
    'timeout': timeout,
    'allowed_updates': allowedUpdates,
  });
}

class _SetWebhook extends _Command<bool> implements SetWebhook {
  final String url;
  final InputFile certificate;
  final int maxConnections;
  final List<String> allowedUpdates;

  _SetWebhook(
      this.url, {
        this.certificate,
        this.maxConnections,
        Iterable<String> allowedUpdates,
      })
      : this.allowedUpdates = copyList(allowedUpdates),
        super._('setWebhook', _boolean);

  @override
  Map<String, Object> get data => noNull({
    'url': url,
    'certificate': Serializable.toMapOrNull(certificate),
    'max_connections': maxConnections,
    'allowed_updates': allowedUpdates,
  });
}

class _DeleteWebhook extends _Command<bool> implements DeleteWebhook {
  _DeleteWebhook() : super._('deleteWebhook', _boolean);

  @override
  Map<String, Object> get data => const {};
}

class _GetWebhookInfo extends _Command<WebhookInfo> implements GetWebhookInfo {
  _GetWebhookInfo() : super._('getWebhookInfo', _WebhookInfo.fromMap);

  @override
  Map<String, Object> get data => const {};
}

class _WebhookInfo extends Serializable implements WebhookInfo {
  final String url;
  final bool hasCustomCertificate;
  final int pendingUpdateCount;
  final int lastErrorDate;
  final String lastErrorMessage;
  final int maxConnections;
  final List<String> allowedUpdates;

  _WebhookInfo(
    this.url,
    this.hasCustomCertificate,
    this.pendingUpdateCount, {
    this.lastErrorDate,
    this.lastErrorMessage,
    this.maxConnections,
    Iterable<String> allowedUpdates,
  })
      : this.allowedUpdates = copyList(allowedUpdates);

  static _WebhookInfo fromMap(Map<String, Object> map) => map == null
      ? null
      : new _WebhookInfo(
          map['url'],
          map['has_custom_certificate'],
          map['pending_update_count'],
          lastErrorDate: map['last_error_date'],
          lastErrorMessage: map['last_error_message'],
          maxConnections: map['max_connections'],
          allowedUpdates: map['allowed_updates'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'url': url,
        'has_custom_certificate': hasCustomCertificate,
        'pending_update_count': pendingUpdateCount,
        'last_error_date': lastErrorDate,
        'last_error_message': lastErrorDate,
        'max_connections': maxConnections,
        'allowed_updates': allowedUpdates,
      });
}

class _User extends Serializable implements User {
  final int id;
  final bool isBot;
  final String firstName;
  final String lastName;
  final String username;
  final String languageCode;

  _User(
    this.id,
    this.isBot,
    this.firstName, {
    this.lastName,
    this.username,
    this.languageCode,
  });

  static _User fromMap(Map<String, Object> map) => map == null
      ? null
      : new _User(
          map['id'],
          map['is_bot'],
          map['first_name'],
          lastName: map['last_name'],
          username: map['username'],
          languageCode: map['language_code'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'id': id,
        'is_bot': isBot,
        'first_name': firstName,
        'last_name': lastName,
        'username': username,
        'language_code': languageCode,
      });
}

class _Chat extends Serializable implements Chat {
  final int id;
  final String type;
  final String title;
  final String username;
  final String firstName;
  final String lastName;
  final bool allMembersAreAdministrators;
  final _ChatPhoto photo;
  final String description;
  final String inviteLink;
  final _Message pinnedMessage;

  _Chat(
    this.id,
    this.type, {
    this.title,
    this.username,
    this.firstName,
    this.lastName,
    this.allMembersAreAdministrators,
    ChatPhoto photo,
    this.description,
    this.inviteLink,
    Message pinnedMessage,
  })
      : this.photo = photo as _ChatPhoto,
        this.pinnedMessage = pinnedMessage as _Message;

  static _Chat fromMap(Map<String, Object> map) => map == null
      ? null
      : new _Chat(
          map['id'],
          map['type'],
          title: map['title'],
          username: map['username'],
          firstName: map['first_name'],
          lastName: map['last_name'],
          allMembersAreAdministrators: map['all_members_are_administrators'],
          photo: _ChatPhoto.fromMap(map['photo']),
          description: map['description'],
          inviteLink: map['invite_link'],
          pinnedMessage: _Message.fromMap(map['pinned_message']),
        );

  @override
  Map<String, Object> createMap() => noNull({
        'id': id,
        'type': type,
        'title': title,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'all_members_are_administrators': allMembersAreAdministrators,
        'photo': photo?.toMap(),
        'description': description,
        'invite_link': inviteLink,
        'pinned_message': pinnedMessage?.toMap(),
      });
}

class _Message extends Serializable implements Message {
  final int messageId;
  final _User from;
  final int date;
  final _Chat chat;
  final _User forwardFrom;
  final int forwardFromMessageId;
  final String forwardSignature;
  final int forwardDate;
  final _Message replyToMessage;
  final int editDate;
  final String authorSignature;
  final String text;
  final List<_MessageEntity> entities;
  final _Audio audio;
  final _Document document;
  final _Game game;
  final List<_PhotoSize> photo;
//  final Sticker sticker;
  final _Video video;
  final _Voice voice;
  final _VideoNote videoNote;
  final String caption;
  final _Contact contact;
  final _Location location;
  final _Venue venue;
  final List<_User> newChatMembers;
  final _User leftChatMember;
  final String newChatTitle;
  final List<_PhotoSize> newChatPhoto;
  final bool deleteChatPhoto;
  final bool groupChatCreated;
  final bool supergroupChatCreated;
  final bool channelChatCreated;
  final int migrateToChatId;
  final int migrateFromChatId;
  final _Message pinnedMessage;
  final _Invoice invoice;
  final _SuccessfulPayment successfulPayment;

  _Message(
    this.messageId,
    User from,
    this.date,
    Chat chat, {
    User forwardFrom,
    this.forwardFromMessageId,
    this.forwardSignature,
    this.forwardDate,
    Message replyToMessage,
    this.editDate,
    this.authorSignature,
    this.text,
    Iterable<MessageEntity> entities,
    Audio audio,
    Document document,
    Game game,
    Iterable<PhotoSize> photo,
    Video video,
    Voice voice,
    VideoNote videoNote,
    this.caption,
    Contact contact,
    Location location,
    Venue venue,
    Iterable<User> newChatMembers,
    User leftChatMember,
    this.newChatTitle,
    Iterable<PhotoSize> newChatPhoto,
    this.deleteChatPhoto,
    this.groupChatCreated,
    this.supergroupChatCreated,
    this.channelChatCreated,
    this.migrateToChatId,
    this.migrateFromChatId,
    Message pinnedMessage,
    Invoice invoice,
    SuccessfulPayment successfulPayment,
  })
      : this.from = from as _User,
        this.chat = chat as _Chat,
        this.forwardFrom = forwardFrom as _User,
        this.replyToMessage = replyToMessage as _Message,
        this.entities =
            copyList(mapOrNull(entities, (e) => e as _MessageEntity)),
        this.audio = audio as _Audio,
        this.document = document as _Document,
        this.game = game as _Game,
        this.photo = copyList(mapOrNull(photo, (e) => e as _PhotoSize)),
        this.video = video as _Video,
        this.voice = voice as _Voice,
        this.videoNote = videoNote as _VideoNote,
        this.contact = contact as _Contact,
        this.location = location as _Location,
        this.venue = venue as _Venue,
        this.newChatMembers =
            copyList(mapOrNull(newChatMembers, (e) => e as _User)),
        this.leftChatMember = leftChatMember as _User,
        this.newChatPhoto =
            copyList(mapOrNull(newChatPhoto, (e) => e as _PhotoSize)),
        this.pinnedMessage = pinnedMessage as _Message,
        this.invoice = invoice as _Invoice,
        this.successfulPayment = successfulPayment as _SuccessfulPayment;

  static _Message fromMap(Map<String, Object> map) => map == null
      ? null
      : new _Message(
          map['message_id'],
          _User.fromMap(map['from']),
          map['date'],
          _Chat.fromMap(map['chat']),
          forwardFrom: _User.fromMap(map['forward_from']),
          forwardFromMessageId: map['forward_from_message_id'],
          forwardSignature: map['forward_signature'],
          forwardDate: map['forward_date'],
          replyToMessage: fromMap(map['reply_to_message']),
          editDate: map['edit_date'],
          authorSignature: map['author_signature'],
          text: map['text'],
          entities: mapOrNull(map['entities'], _MessageEntity.fromMap),
          audio: _Audio.fromMap(map['audio']),
          document: _Document.fromMap(map['document']),
          game: _Game.fromMap(map['game']),
          photo: mapOrNull(map['photo'], _PhotoSize.fromMap),
          video: _Video.fromMap(map['video']),
          voice: _Voice.fromMap(map['voice']),
          videoNote: _VideoNote.fromMap(map['video_note']),
          caption: map['caption'],
          contact: _Contact.fromMap(map['contact']),
          location: _Location.fromMap(map['location']),
          venue: _Venue.fromMap(map['venue']),
          newChatMembers: mapOrNull(map['new_chat_members'], _User.fromMap),
          leftChatMember: _User.fromMap(map['left_chat_member']),
          newChatTitle: map['new_chat_title'],
          newChatPhoto: mapOrNull(map['new_chat_photo'], _PhotoSize.fromMap),
          deleteChatPhoto: map['delete_chat_photo'],
          groupChatCreated: map['group_chat_created'],
          supergroupChatCreated: map['supergroup_chat_created'],
          channelChatCreated: map['channel_chat_created'],
          migrateToChatId: map['migrate_to_chat_id'],
          migrateFromChatId: map['migrate_from_chat_id'],
          pinnedMessage: _Message.fromMap(map['pinned_message']),
          invoice: _Invoice.fromMap(map['invoice']),
          successfulPayment:
              _SuccessfulPayment.fromMap(map['successful_payment']),
        );

  @override
  Map<String, Object> createMap() => noNull({
        'message_id': messageId,
        'from': from?.toMap(),
        'date': date,
        'chat': chat?.toMap(),
        'forward_from': forwardFrom?.toMap(),
        'forward_from_message_id': forwardFromMessageId,
        'forward_signature': forwardSignature,
        'forward_date': forwardDate,
        'reply_to_message': replyToMessage?.toMap(),
        'edit_date': editDate,
        'author_signature': authorSignature,
        'text': text,
        'entities': ls(entities),
        'audio': audio?.toMap(),
        'document': document?.toMap(),
        'game': game?.toMap(),
        'photo': ls(photo),
        'video': video?.toMap(),
        'voice': voice?.toMap(),
        'video_note': videoNote?.toMap(),
        'caption': caption,
        'contact': contact?.toMap(),
        'location': location?.toMap(),
        'venue': venue?.toMap(),
        'new_chat_members': ls(newChatMembers),
        'left_chat_member': leftChatMember?.toMap(),
        'new_chat_title': newChatTitle,
        'new_chat_photo': ls(newChatPhoto),
        'delete_chat_photo': deleteChatPhoto,
        'groupChatCreated': groupChatCreated,
        'supergroup_chat_created': supergroupChatCreated,
        'channel_chat_created': channelChatCreated,
        'migrate_to_chat_id': migrateToChatId,
        'migrate_from_chat_id': migrateFromChatId,
        'pinned_message': pinnedMessage?.toMap(),
        'invoice': invoice?.toMap(),
        'successful_payment': successfulPayment?.toMap(),
      });
}

class _MessageEntity extends Serializable implements MessageEntity {
  final String type;
  final int offset;
  final int length;
  final String url;
  final _User user;

  _MessageEntity(
    this.type,
    this.offset,
    this.length, {
    this.url,
    User user,
  })
      : this.user = user as _User;

  static _MessageEntity fromMap(Map<String, Object> map) => map == null
      ? null
      : new _MessageEntity(map['type'], map['offset'], map['length'],
          url: map['url'],
          user: _User.fromMap(
            map['user'],
          ));

  @override
  Map<String, Object> createMap() => noNull({
        'type': type,
        'offset': offset,
        'length': length,
        'url': url,
        'user': user?.toMap(),
      });
}

class _PhotoSize extends Serializable implements PhotoSize {
  final String fileId;
  final int width;
  final int height;
  final int fileSize;

  _PhotoSize(this.fileId, this.width, this.height, {this.fileSize});

  static _PhotoSize fromMap(Map<String, Object> map) => map == null
      ? null
      : new _PhotoSize(
          map['file_id'],
          map['width'],
          map['height'],
          fileSize: map['file_size'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'file_id': fileId,
        'width': width,
        'height': height,
        'file_size': fileSize,
      });
}

class _Audio extends Serializable implements Audio {
  final String fileId;
  final int duration;
  final String performer;
  final String title;
  final String mimeType;
  final int fileSize;

  _Audio(
    this.fileId,
    this.duration, {
    this.performer,
    this.title,
    this.mimeType,
    this.fileSize,
  });

  static _Audio fromMap(Map<String, Object> map) => map == null
      ? null
      : new _Audio(
          map['file_id'],
          map['duration'],
          performer: map['performer'],
          title: map['title'],
          mimeType: map['mime_type'],
          fileSize: map['file_size'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'file_id': fileId,
        'duration': duration,
        'performer': performer,
        'title': title,
        'mime_type': mimeType,
        'file_size': fileSize,
      });
}

class _Document extends Serializable implements Document {
  final String fileId;
  final _PhotoSize thumb;
  final String fileName;
  final String mimeType;
  final int fileSize;

  _Document(
    this.fileId, {
    PhotoSize thumb,
    this.fileName,
    this.mimeType,
    this.fileSize,
  })
      : this.thumb = thumb as _PhotoSize;

  static _Document fromMap(Map<String, Object> map) => map == null
      ? null
      : new _Document(
          map['file_id'],
          thumb: _PhotoSize.fromMap(map['thumb']),
          fileName: map['file_name'],
          mimeType: map['mime_type'],
          fileSize: map['file_size'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'file_id': fileId,
        'thumb': thumb?.toMap(),
        'file_name': fileName,
        'mime_type': mimeType,
        'file_size': fileSize,
      });
}

class _Video extends Serializable implements Video {
  final String fileId;
  final int width;
  final int height;
  final int duration;
  final _PhotoSize thumb;
  final String mimeType;
  final int fileSize;

  _Video(
    this.fileId,
    this.width,
    this.height,
    this.duration, {
    PhotoSize thumb,
    this.mimeType,
    this.fileSize,
  })
      : this.thumb = thumb as _PhotoSize;

  static _Video fromMap(Map<String, Object> map) => map == null
      ? null
      : new _Video(
          map['file_id'],
          map['width'],
          map['height'],
          map['duration'],
          thumb: _PhotoSize.fromMap(map['thumb']),
          mimeType: map['mime_type'],
          fileSize: map['file_size'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'file_id': fileId,
        'width': width,
        'height': height,
        'duration': duration,
        'thumb': thumb?.toMap(),
        'mime_type': mimeType,
        'file_size': fileSize,
      });
}

class _Voice extends Serializable implements Voice {
  final String fileId;
  final int duration;
  final String mimeType;
  final int fileSize;

  _Voice(
    this.fileId,
    this.duration, {
    this.mimeType,
    this.fileSize,
  });

  static _Voice fromMap(Map<String, Object> map) => map == null
      ? null
      : new _Voice(
          map['file_id'],
          map['duration'],
          mimeType: map['mime_type'],
          fileSize: map['file_size'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'file_id': fileId,
        'duration': duration,
        'mime_type': mimeType,
        'file_size': fileSize,
      });
}

class _VideoNote extends Serializable implements VideoNote {
  final String fileId;
  final int length;
  final int duration;
  final _PhotoSize thumb;
  final int fileSize;

  _VideoNote(
    this.fileId,
    this.length,
    this.duration, {
    PhotoSize thumb,
    this.fileSize,
  })
      : this.thumb = thumb as _PhotoSize;

  static _VideoNote fromMap(Map<String, Object> map) => map == null
      ? null
      : new _VideoNote(
          map['file_id'],
          map['length'],
          map['duration'],
          thumb: _PhotoSize.fromMap(map['thumb']),
          fileSize: map['file_size'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'file_id': fileId,
        'length': length,
        'duration': duration,
        'thumb': thumb?.toMap(),
        'file_size': fileSize,
      });
}

class _Contact extends Serializable implements Contact {
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final int userId;

  _Contact(
    this.phoneNumber,
    this.firstName, {
    this.lastName,
    this.userId,
  });

  static _Contact fromMap(Map<String, Object> map) => map == null
      ? null
      : new _Contact(
          map['phone_number'],
          map['first_name'],
          lastName: map['last_name'],
          userId: map['user_id'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'phone_number': phoneNumber,
        'first_name': firstName,
        'last_name': lastName,
        'user_id': userId,
      });
}

class _Location extends Serializable implements Location {
  final double longitude;
  final double latitude;

  _Location(this.longitude, this.latitude);

  static _Location fromMap(Map<String, Object> map) => map == null
      ? null
      : new _Location(
          map['longitude'],
          map['latitude'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'longitude': longitude,
        'latitude': latitude,
      });
}

class _Venue extends Serializable implements Venue {
  final _Location location;
  final String title;
  final String address;
  final String foursquareId;

  _Venue(
    Location location,
    this.title,
    this.address, {
    this.foursquareId,
  })
      : this.location = location as _Location;

  static _Venue fromMap(Map<String, Object> map) => map == null
      ? null
      : new _Venue(_Location.fromMap(map), map['title'], map['address'],
          foursquareId: map['foursquare_id']);

  @override
  Map<String, Object> createMap() => noNull({
        'location': location?.toMap(),
        'title': title,
        'address': address,
        'foursquare_id': foursquareId,
      });
}

class _UserProfilePhotos extends Serializable implements UserProfilePhotos {
  final int totalCount;
  final List<List<_PhotoSize>> photos;

  _UserProfilePhotos(this.totalCount, Iterable<Iterable<PhotoSize>> photos)
      : this.photos = ii2ll(photos, (p) => p as _PhotoSize);

  _UserProfilePhotos._(this.totalCount, this.photos);

  static _UserProfilePhotos fromMap(Map<String, Object> map) => map == null
      ? null
      : new _UserProfilePhotos._(
          map['total_count'], ii2ll(map['photos'], _PhotoSize.fromMap));

  @override
  Map<String, Object> createMap() => noNull({
        'total_count': totalCount,
        'photos': ll2m(photos, (ps) => ps.toMap()),
      });
}

class _File extends Serializable implements File {
  final String fileId;
  final int fileSize;
  final String filePath;

  _File(
    this.fileId, {
    this.fileSize,
    this.filePath,
  });

  static _File fromMap(Map<String, Object> map) => map == null
      ? null
      : new _File(
          map['file_id'],
          fileSize: map['file_size'],
          filePath: map['file_path'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'file_id': fileId,
        'file_size': fileSize,
        'file_path': filePath,
      });
}

class _ReplyKeyboardMarkup extends Serializable implements ReplyKeyboardMarkup {
  final List<List<_KeyboardButton>> keyboard;
  final bool resizeKeyboard;
  final bool oneTimeKeyboard;
  final bool selective;

  _ReplyKeyboardMarkup(
      Iterable<Iterable<KeyboardButton>> keyboard, {
        this.resizeKeyboard,
        this.oneTimeKeyboard,
        this.selective,
      })
      : this.keyboard = ii2ll(keyboard, (k) => k as _KeyboardButton);

  @override
  Map<String, Object> createMap() => noNull({
    'keyboard': ll2m(keyboard, (kb) => kb.toMap()),
    'resize_keyboard': resizeKeyboard,
    'one_time_keyboard': oneTimeKeyboard,
    'selective': selective,
  });
}

class _KeyboardButton extends Serializable implements KeyboardButton {
  final String text;
  final bool requestContact;
  final bool requestLocation;

  _KeyboardButton(
      this.text, {
        this.requestContact,
        this.requestLocation,
      });

  @override
  Map<String, Object> createMap() => noNull({
    'text': text,
    'request_contact': requestContact,
    'request_location': requestLocation,
  });
}

class _ReplyKeyboardRemove extends Serializable implements ReplyKeyboardRemove {
  final bool selective;

  _ReplyKeyboardRemove({
    this.selective,
  });

  @override
  Map<String, Object> createMap() => noNull({
    'remove_keyboard': true,
    'selective': selective,
  });
}

class _InlineKeyboardMarkup extends Serializable
    implements InlineKeyboardMarkup {
  final List<List<InlineKeyboardButton>> inlineKeyboard;

  _InlineKeyboardMarkup(Iterable<Iterable<InlineKeyboardButton>> inlineKeyboard)
      : this.inlineKeyboard =
  ii2ll(inlineKeyboard, (k) => k as _InlineKeyboardButton);

  @override
  Map<String, Object> createMap() => noNull({
    'inline_keyboard': ll2m(inlineKeyboard, (kb) => kb._toMap()),
  });
}

class _InlineKeyboardButton extends Serializable
    implements InlineKeyboardButton {
  final String text;
  final String url;
  final String callbackData;
  final String switchInlineQuery;
  final String switchInlineQueryCurrentChat;
  final _CallbackGame callbackGame;
  final bool pay;

  _InlineKeyboardButton(this.text,
      {this.url,
        this.callbackData,
        this.switchInlineQuery,
        this.switchInlineQueryCurrentChat,
        CallbackGame callbackGame,
        this.pay})
      : this.callbackGame = callbackGame as _CallbackGame;

  @override
  Map<String, Object> createMap() => noNull({
    'text': text,
    'url': url,
    'callback_data': callbackData,
    'switch_inline_query': switchInlineQuery,
    'switch_inline_query_current_chat': switchInlineQueryCurrentChat,
    'callback_game': callbackGame?.toMap(),
    'pay': pay,
  });
}

class _CallbackQuery extends Serializable implements CallbackQuery {
  final String id;
  final _User from;
  final String chatInstance;
  final _Message message;
  final String inlineMessageId;
  final String data;
  final String gameShortName;

  _CallbackQuery(
      this.id,
      User from,
      this.chatInstance, {
        Message message,
        this.inlineMessageId,
        this.data,
        this.gameShortName,
      })
      : this.from = from as _User,
        this.message = message as _Message;

  static _CallbackQuery fromMap(Map<String, Object> map) => map == null
      ? null
      : new _CallbackQuery(
    map['id'],
    _User.fromMap(map['from']),
    map['chat_instance'],
    message: _Message.fromMap(map['message']),
    inlineMessageId: map['inline_message_id'],
    data: map['data'],
    gameShortName: map['game_short_name'],
  );

  @override
  Map<String, Object> createMap() => noNull({
    'id': id,
    'from': from?.toMap(),
    'chat_instance': chatInstance,
    'message': message?.toMap(),
    'inline_message_id': inlineMessageId,
    'data': data,
    'game_short_name': gameShortName,
  });
}

class _ForceReply extends Serializable implements ForceReply {
  final bool selective;

  _ForceReply({
    this.selective,
  });

  @override
  Map<String, Object> createMap() => noNull({
    'force_reply': true,
    'selective': selective,
  });
}

class _ChatPhoto extends Serializable implements ChatPhoto {
  final String smallFileId;
  final String bigFileId;

  _ChatPhoto(
      this.smallFileId,
      this.bigFileId,
      );

  static _ChatPhoto fromMap(Map<String, Object> map) => map == null
      ? null
      : new _ChatPhoto(map['small_file_id'], map['big_file_id']);

  @override
  Map<String, Object> createMap() => noNull({
    'small_file_id': smallFileId,
    'big_file_id': bigFileId,
  });
}

class _ChatMember extends Serializable implements ChatMember {
  final _User user;
  final String status;
  final int untilDate;
  final bool canBeEdited;
  final bool canChangeInfo;
  final bool canPostMessages;
  final bool canEditMessages;
  final bool canDeleteMessages;
  final bool canInviteUsers;
  final bool canRestrictMembers;
  final bool canPinMessages;
  final bool canPromoteMembers;
  final bool canSendMessages;
  final bool canSendMediaMessages;
  final bool canSendOtherMessages;
  final bool canAddWebPagePreviews;

  _ChatMember(
      User user,
      this.status, {
        this.untilDate,
        this.canBeEdited,
        this.canChangeInfo,
        this.canPostMessages,
        this.canEditMessages,
        this.canDeleteMessages,
        this.canInviteUsers,
        this.canRestrictMembers,
        this.canPinMessages,
        this.canPromoteMembers,
        this.canSendMessages,
        this.canSendMediaMessages,
        this.canSendOtherMessages,
        this.canAddWebPagePreviews,
      })
      : this.user = user as _User;

  static _ChatMember fromMap(Map<String, Object> map) => map == null
      ? null
      : new _ChatMember(
    _User.fromMap(map['user']),
    map['status'],
    untilDate: map['until_date'],
    canBeEdited: map['can_be_edited'],
    canChangeInfo: map['can_change_info'],
    canPostMessages: map['can_post_messages'],
    canEditMessages: map['can_edit_messages'],
    canDeleteMessages: map['can_delete_messages'],
    canInviteUsers: map['can_invite_users'],
    canRestrictMembers: map['can_restrict_members'],
    canPinMessages: map['can_pin_messages'],
    canPromoteMembers: map['can_promote_members'],
    canSendMessages: map['can_send_messages'],
    canSendMediaMessages: map['can_send_media_messages'],
    canSendOtherMessages: map['can_send_other_messages'],
    canAddWebPagePreviews: map['can_add_web_page_previews'],
  );

  @override
  Map<String, Object> createMap() => noNull({
    'user': user?.toMap(),
    'status': status,
    'until_date': untilDate,
    'can_be_edited': null,
    'can_change_info': null,
    'can_post_messages': null,
    'can_edit_messages': null,
    'can_delete_messages': null,
    'can_invite_users': null,
    'can_restrict_members': null,
    'can_pin_messages': null,
    'can_promote_members': null,
    'can_send_messages': null,
    'can_send_media_messages': null,
    'can_send_other_messages': null,
    'can_add_web_page_previews': null,
  });
}

class _ResponseParameters extends Serializable implements ResponseParameters {
  final int migrateToChatId;
  final int retry_after;

  _ResponseParameters({
    this.migrateToChatId,
    this.retry_after,
  });

  static _ResponseParameters fromMap(Map<String, Object> map) => map == null
      ? null
      : new _ResponseParameters(
      migrateToChatId: map['migrate_to_chat_id'],
      retry_after: map['retry_after']);

  @override
  Map<String, Object> createMap() => noNull({
    'migrate_to_chat_id': migrateToChatId,
    'retry_after': retry_after,
  });
}

class InputFile {
  Map<String, Object> createMap() => {};
}

class _GetMe extends _Command<User> implements GetMe {
  _GetMe() : super._('getMe', _User.fromMap);

  @override
  Map<String, Object> get data => const {};
}

class _SendMessage extends _Command<Message> implements SendMessage {
  final Object chatId;
  final String text;
  final String parseMode;
  final bool disableWebPagePreview;
  final bool disableNotification;
  final int replyToMessageId;
  final ReplyMarkup replyMarkup;

  _SendMessage(
      this.chatId,
      this.text,
      this.parseMode, {
        this.disableWebPagePreview = false,
        this.disableNotification = false,
        this.replyToMessageId,
        this.replyMarkup,
      })
      : super._('sendMessage', _Message.fromMap);

  @override
  Map<String, Object> get data => noNull({
    'chat_id': chatId,
    'text': text,
    'parse_mode': parseMode,
    'disable_web_page_preview': disableWebPagePreview,
    'disable_notification': disableNotification,
    'reply_to_message_id': replyToMessageId,
    'reply_markup': Serializable.toMapOrNull(replyMarkup),
  });
}

class _ForwardMessage extends _Command<Message> implements ForwardMessage {
  final Object chatId;
  final Object fromChatId;
  final bool disableNotifications;
  final int messageId;

  _ForwardMessage(
      this.chatId,
      this.fromChatId,
      this.messageId, {
        this.disableNotifications,
      })
      : super._('forwardMessage', _Message.fromMap);

  @override
  Map<String, Object> get data => noNull({
    'chat_id': chatId,
    'from_chat_id': fromChatId,
    'disable_notifications': disableNotifications,
    'message_id': messageId,
  });
}

class _InlineQuery extends Serializable implements InlineQuery {
  final String id;
  final _User from;
  final _Location location;
  final String query;
  final String offset;

  _InlineQuery(
    this.id,
    User from,
    Location location,
    this.query,
    this.offset,
  )
      : this.from = from as _User,
        this.location = location as _Location;

  static _InlineQuery fromMap(Map<String, Object> map) => map == null
      ? null
      : new _InlineQuery(
          map['id'],
          _User.fromMap(map['from']),
          _Location.fromMap(map['location']),
          map['query'],
          map['offset'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'id': id,
        'from': from?.toMap(),
        'location': location?.toMap(),
        'query': query,
        'offset': offset,
      });
}

class _AnswerInlineQuery extends _Command<bool> implements AnswerInlineQuery {
  final String inlineQueryId;
  final List<InlineQueryResult> results;
  final int cacheTime;
  final bool isPersonal;
  final String nextOffset;
  final String switchPmText;
  final String switchPmParameter;

  _AnswerInlineQuery(
      this.inlineQueryId,
      Iterable<InlineQueryResult> results, {
        this.cacheTime = 300,
        this.isPersonal = true,
        this.nextOffset,
        this.switchPmText,
        this.switchPmParameter,
      })
      : this.results = copyList(results),
        super._('answerInlineQuery', _boolean);

  @override
  Map<String, Object> get data => noNull({
    'inline_query_id': inlineQueryId,
    'results': copyList(mapOrNull(results, (i) => i.toMap())) ?? [],
    'cache_time': cacheTime,
    'is_personal': isPersonal,
    'next_offset': nextOffset,
    'switch_pm_text': switchPmText,
    'switch_pm_parameter': switchPmParameter,
  });
}

abstract class _InlineQueryResult extends Serializable {
  final String type;
  final String id;

  _InlineQueryResult(this.type, this.id);

  @override
  Map<String, Object> createMap() => noNull({
    'type': type,
    'id': id,
  });
}

class _InlineQueryResultArticle extends _InlineQueryResult
    implements InlineQueryResultArticle {
  final String title;
  final _InputMessageContent inputMessageContent;
  final _InlineKeyboardMarkup replyMarkup;
  final String url;
  final bool hideUrl;
  final String description;
  final String thumbUrl;
  final int thumbWidth;
  final int thumbHeight;

  _InlineQueryResultArticle(
      String id,
      this.title,
      InputMessageContent inputMessageContent, {
        InlineKeyboardMarkup replyMarkup,
        this.url,
        this.hideUrl,
        this.description,
        this.thumbUrl,
        this.thumbWidth,
        this.thumbHeight,
      })
      : this.inputMessageContent = inputMessageContent as _InputMessageContent,
        this.replyMarkup = replyMarkup as _InlineKeyboardMarkup,
        super('article', id);

  @override
  Map<String, Object> createMap() => noNull(new Map.from(super.createMap())
    ..addAll({
      'title': title,
      'input_message_content': inputMessageContent?.toMap(),
      'reply_markup': replyMarkup?.toMap(),
      'url': url,
      'hide_url': hideUrl,
      'description': description,
      'thumb_url': thumbUrl,
      'thumb_width': thumbWidth,
      'thumb_height': thumbHeight,
    }));
}

class _InlineQueryResultGif extends _InlineQueryResult
    implements InlineQueryResultGif {
  final String gifUrl;
  final int gifWidth;
  final int gifHeight;
  final int gifDuration;
  final String thumbUrl;
  final String title;
  final String caption;
  final _InlineKeyboardMarkup replyMarkup;
  final _InputMessageContent inputMessageContent;

  _InlineQueryResultGif(
      String id,
      this.gifUrl, {
        this.gifWidth,
        this.gifHeight,
        this.gifDuration,
        String thumbUrl,
        this.title,
        this.caption,
        InlineKeyboardMarkup replyMarkup,
        InputMessageContent inputMessageContent,
      })
      : this.thumbUrl = thumbUrl ?? gifUrl,
        this.replyMarkup = replyMarkup as _InlineKeyboardMarkup,
        this.inputMessageContent = inputMessageContent as _InputMessageContent,
        super('gif', id);

  @override
  Map<String, Object> createMap() => noNull(new Map.from(super.createMap())
    ..addAll({
      'gif_url': gifUrl,
      'gif_width': gifWidth,
      'gif_height': gifHeight,
      'thumb_url': thumbUrl,
      'title': title,
      'caption': caption,
      'reply_markup': replyMarkup?.toMap(),
      'input_message_content': inputMessageContent?.toMap(),
    }));
}

abstract class _InputMessageContent extends Serializable
    implements InputMessageContent {}

class _InputTextMessageContent extends _InputMessageContent
    implements InputTextMessageContent {
  final String messageText;
  final String parseMode;
  final bool disableWebPagePreview;

  _InputTextMessageContent(
      this.messageText, this.parseMode, this.disableWebPagePreview);

  @override
  Map<String, Object> createMap() => noNull({
    'message_text': messageText,
    'parse_mode': parseMode,
    'disable_web_page_preview': disableWebPagePreview,
  });
}

class _InputLocationMessageContent extends _InputMessageContent
    implements InputLocationMessageContent {
  final double longitude;
  final double latitude;

  _InputLocationMessageContent(this.longitude, this.latitude);

  @override
  Map<String, Object> createMap() => noNull({
    'longitude': longitude,
    'latitude': latitude,
  });
}

class _InputVenueMessageContent extends _InputMessageContent
    implements InputVenueMessageContent {
  final double longitude;
  final double latitude;
  final String title;
  final String address;
  final String foursquareId;

  _InputVenueMessageContent(
      this.longitude, this.latitude, this.title, this.address,
      {this.foursquareId});

  @override
  Map<String, Object> createMap() => noNull({
    'longitude': longitude,
    'latitude': latitude,
    'title': title,
    'address': address,
    'foursquare_id': foursquareId,
  });
}

class _InputContactMessageContent extends _InputMessageContent
    implements InputContactMessageContent {
  final String phoneNumber;
  final String firstName;
  final String lastName;

  _InputContactMessageContent(
      this.phoneNumber,
      this.firstName, {
        this.lastName,
      });

  @override
  Map<String, Object> createMap() => noNull({
    'phone_number': phoneNumber,
    'first_name': firstName,
    'last_name': lastName,
  });
}

class _ChosenInlineResult extends Serializable implements ChosenInlineResult {
  final String resultId;
  final _User from;
  final String query;
  final _Location location;
  final String inlineMessageId;

  _ChosenInlineResult(
    this.resultId,
    User from,
    this.query, {
    Location location,
    this.inlineMessageId,
  })
      : this.from = from as _User,
        this.location = location as _Location;

  static _ChosenInlineResult fromMap(Map<String, Object> map) => map == null
      ? null
      : new _ChosenInlineResult(
          map['result_id'],
          _User.fromMap(map['from']),
          map['query'],
          location: _Location.fromMap(map['location']),
          inlineMessageId: map['inline_message_id'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'result_id': resultId,
        'from': from?.toMap(),
        'query': query,
        'location': location?.toMap(),
        'inline_message_id': inlineMessageId,
      });
}

class _LabeledPrice extends Serializable implements LabeledPrice {
  final String label;
  final int amount;

  _LabeledPrice(
      this.label,
      this.amount,
      );

  @override
  Map<String, Object> createMap() => noNull({
    'label': label,
    'amount': amount,
  });
}

class _Invoice extends Serializable implements Invoice {
  final String title;
  final String description;
  final String startParameter;
  final String currency;
  final int totalAmount;

  _Invoice(
    this.title,
    this.description,
    this.startParameter,
    this.currency,
    this.totalAmount,
  );

  static _Invoice fromMap(Map<String, Object> map) => map == null
      ? null
      : new _Invoice(
          map['title'],
          map['description'],
          map['start_parameter'],
          map['currency'],
          map['total_amount'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'title': title,
        'description': description,
        'start_parameter': startParameter,
        'currency': currency,
        'total_amount': totalAmount,
      });
}

class _ShippingAddress extends Serializable implements ShippingAddress {
  final String countryCode;
  final String state;
  final String city;
  final String streetLine1;
  final String streetLine2;
  final String postCode;

  _ShippingAddress(
    this.countryCode,
    this.state,
    this.city,
    this.streetLine1,
    this.streetLine2,
    this.postCode,
  );

  static _ShippingAddress fromMap(Map<String, Object> map) => map == null
      ? null
      : new _ShippingAddress(
          map['country_code'],
          map['state'],
          map['city'],
          map['street_line1'],
          map['street_line2'],
          map['post_code'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'country_code': countryCode,
        'state': state,
        'city': city,
        'street_line1': streetLine1,
        'street_line2': streetLine2,
        'post_code': postCode,
      });
}

class _OrderInfo extends Serializable implements OrderInfo {
  final String name;
  final String phoneNumber;
  final String email;
  final _ShippingAddress shippingAddress;

  _OrderInfo({
    this.name,
    this.phoneNumber,
    this.email,
    ShippingAddress shippingAddress,
  })
      : this.shippingAddress = shippingAddress as _ShippingAddress;

  static _OrderInfo fromMap(Map<String, Object> map) => map == null
      ? null
      : new _OrderInfo(
          name: map['name'],
          phoneNumber: map['phone_number'],
          email: map['email'],
          shippingAddress: _ShippingAddress.fromMap(map['shipping_address']),
        );

  @override
  Map<String, Object> createMap() => noNull({
        'name': name,
        'phone_number': phoneNumber,
        'email': email,
        'shipping_address': shippingAddress?.toMap(),
      });
}

class _ShippingOption extends Serializable implements ShippingOption {
  final String id;
  final String title;
  final List<_LabeledPrice> prices;

  _ShippingOption(this.id, this.title, Iterable<LabeledPrice> prices)
      : this.prices = copyList(mapOrNull(prices, (e) => e as _LabeledPrice));

  @override
  Map<String, Object> createMap() => noNull({
    'id': id,
    'title': title,
    'prices': ls(prices),
  });
}

class _SuccessfulPayment extends Serializable implements SuccessfulPayment {
  final String currency;
  final int totalAmmount;
  final String invoicePayload;
  final String telegramPaymentChargeId;
  final String providerPaymentChargeId;
  final String shippingOptionId;
  final _OrderInfo orderInfo;

  _SuccessfulPayment(
    this.currency,
    this.totalAmmount,
    this.invoicePayload,
    this.telegramPaymentChargeId,
    this.providerPaymentChargeId, {
    this.shippingOptionId,
    OrderInfo orderInfo,
  })
      : this.orderInfo = orderInfo as _OrderInfo;

  static _SuccessfulPayment fromMap(Map<String, Object> map) => map == null
      ? null
      : new _SuccessfulPayment(
          map['currency'],
          map['total_amount'],
          map['invoice_payload'],
          map['telegram_payment_charge_id'],
          map['provider_payment_charge_id'],
          shippingOptionId: map['shipping_option_id'],
          orderInfo: _OrderInfo.fromMap(map['order_info']),
        );

  @override
  Map<String, Object> createMap() => noNull({
        'currency': currency,
        'total_amount': totalAmmount,
        'invoice_payload': invoicePayload,
        'telegram_payment_charge_id': telegramPaymentChargeId,
        'provider_payment_charge_id': providerPaymentChargeId,
        'shipping_option_id': shippingOptionId,
        'order_info': orderInfo?.toMap(),
      });
}

class _ShippingQuery extends Serializable implements ShippingQuery {
  final String id;
  final _User from;
  final String invoicePayload;
  final _ShippingAddress shippingAddress;

  _ShippingQuery(
    this.id,
    User from,
    this.invoicePayload,
    ShippingAddress shippingAddress,
  )
      : this.from = from as _User,
        this.shippingAddress = shippingAddress as _ShippingAddress;

  static _ShippingQuery fromMap(Map<String, Object> map) => map == null
      ? null
      : new _ShippingQuery(
          map['id'],
          _User.fromMap(map['from']),
          map['invoice_payload'],
          _ShippingAddress.fromMap(map['shipping_address']),
        );

  @override
  Map<String, Object> createMap() => noNull({
        'id': id,
        'from': from?.toMap(),
        'invoice_payload': invoicePayload,
        'shipping_address': shippingAddress?.toMap(),
      });
}

class _PreCheckoutQuery extends Serializable implements PreCheckoutQuery {
  final String id;
  final _User from;
  final String currency;
  final int totalAmount;
  final String invoicePayload;
  final String shippingOptionId;
  final _OrderInfo orderInfo;

  _PreCheckoutQuery(
    this.id,
    User from,
    this.currency,
    this.totalAmount,
    this.invoicePayload, {
    this.shippingOptionId,
    OrderInfo orderInfo,
  })
      : this.from = from as _User,
        this.orderInfo = orderInfo as _OrderInfo;

  static _PreCheckoutQuery fromMap(Map<String, Object> map) => map == null
      ? null
      : new _PreCheckoutQuery(
          map['id'],
          _User.fromMap(map['from']),
          map['currency'],
          map['total_amount'],
          map['invoice_payload'],
          shippingOptionId: map['shippingPotionId'],
          orderInfo: _OrderInfo.fromMap(map['order_info']),
        );

  @override
  Map<String, Object> createMap() => noNull({
        'id': id,
        'from': from?.toMap(),
        'currency': currency,
        'total_amount': totalAmount,
        'invoice_payload': invoicePayload,
        'shipping_option_id': shippingOptionId,
        'order_info': orderInfo?.toMap(),
      });
}

class _Game extends Serializable implements Game {
  final String title;
  final String description;
  final List<_PhotoSize> photo;
  final String text;
  final List<_MessageEntity> textEntities;
  final _Animation animation;

  _Game(
    this.title,
    this.description,
    Iterable<PhotoSize> photo, {
    this.text,
    Iterable<MessageEntity> textEntities,
    Animation animation,
  })
      : this.photo = copyList(mapOrNull(photo, (e) => e as _PhotoSize)),
        this.textEntities =
            copyList(mapOrNull(textEntities, (e) => e as _MessageEntity)),
        this.animation = animation as _Animation;

  static _Game fromMap(Map<String, Object> map) => map == null
      ? null
      : new _Game(
          map['title'],
          map['description'],
          mapOrNull(map['photo'], _PhotoSize.fromMap),
          text: map['text'],
          textEntities: mapOrNull(map['text_entities'], _MessageEntity.fromMap),
          animation: _Animation.fromMap(map['animation']),
        );

  @override
  Map<String, Object> createMap() => noNull({
        'title': title,
        'description': description,
        'photo': ls(photo),
        'text': text,
        'text_entities': ls(textEntities),
        'animation': animation?.toMap(),
      });
}

class _Animation extends Serializable implements Animation {
  final String fileId;
  final _PhotoSize thumb;
  final String fileName;
  final String mimeType;
  final int fileSize;

  _Animation(
    this.fileId, {
    PhotoSize thumb,
    this.fileName,
    this.mimeType,
    this.fileSize,
  })
      : this.thumb = thumb as _PhotoSize;

  static _Animation fromMap(Map<String, Object> map) => map == null
      ? null
      : new _Animation(
          map['file_id'],
          thumb: _PhotoSize.fromMap(map['thumb']),
          fileName: map['file_name'],
          mimeType: map['mime_type'],
          fileSize: map['file_size'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'file_id': fileId,
        'thumb': thumb?.toMap(),
        'file_name': fileName,
        'mime_type': mimeType,
        'file_size': fileSize,
      });
}

class _CallbackGame extends Serializable implements CallbackGame {
  Map<String, Object> createMap() => const {};
}

class _GameHighScore extends Serializable implements GameHighScore {
  final int position;
  final _User user;
  final int score;

  _GameHighScore(this.position, User user, this.score)
      : this.user = user as _User;

  static _GameHighScore fromMap(Map<String, Object> map) => map == null
      ? null
      : new _GameHighScore(
          map['position'],
          _User.fromMap(map['user']),
          map['score'],
        );

  @override
  Map<String, Object> createMap() => noNull({
        'position': position,
        'user': user?.toMap(),
        'score': score,
      });
}

typedef T _Converter<T>(dynamic result);

final _Converter<bool> _boolean = (b) => b as bool;

abstract class _Command<T> extends Serializable implements Command<T> {
  final String method;
  final _Converter<T> converter;

  _Command._(this.method, this.converter);

  Map<String, Object> get data;

  Map<String, Object> createMap() => {'method': method, 'data': data};

  T convert(Object result) {
    return converter(result);
  }
}

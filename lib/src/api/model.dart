// Copyright (c) 2017, TOPdesk. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

import 'annotation.dart';
import '../impl/util.dart';

part '../impl/model.dart';

/// See the [Telegram Bot API documentation on Update][1].
///
/// [1]: https://core.telegram.org/bots/api#update
@incoming
abstract class Update {
  int get updateId;
  @optional
  Message get message;
  @optional
  Message get editedMessage;
  @optional
  Message get channelPost;
  @optional
  Message get editedChannelPost;
  @optional
  InlineQuery get inlineQuery;
  @optional
  ChosenInlineResult get chosenInlineResult;
  @optional
  CallbackQuery get callbackQuery;
  @optional
  ShippingQuery get shippingQuery;
  @optional
  PreCheckoutQuery get preCheckoutQuery;

  Update._();

  factory Update(
    int updateId, {
    Message message,
    Message editedMessage,
    Message channelPost,
    Message editedChannelPost,
    InlineQuery inlineQuery,
    ChosenInlineResult chosenInlineResult,
    CallbackQuery callbackQuery,
    ShippingQuery shippingQuery,
    PreCheckoutQuery preCheckoutQuery,
  }) = _Update;
}

/// See the [Telegram Bot API documentation on **WebhookInfo**][1].
///
/// [1]: https://core.telegram.org/bots/api#webhookinfo
@incoming
abstract class WebhookInfo {
  String get url;
  bool get hasCustomCertificate;
  int get pendingUpdateCount;
  @optional
  int get lastErrorDate;
  @optional
  String get lastErrorMessage;
  @optional
  int get maxConnections;
  @optional
  List<String> get allowedUpdates;

  WebhookInfo._();

  factory WebhookInfo(
    String url,
    bool hasCustomCertificate,
    int pendingUpdateCount, {
    int lastErrorDate,
    String lastErrorMessage,
    int maxConnections,
    Iterable<String> allowedUpdates,
  }) = _WebhookInfo;
}

/// See the [Telegram Bot API documentation on **InlineQueryResult**][1].
///
/// [1]: https://core.telegram.org/bots/api#user
@incoming
abstract class User {
  int get id;
  bool get isBot;
  String get firstName;
  @optional
  String get lastName;
  @optional
  String get username;
  @optional
  String get languageCode;

  User._();

  factory User(
    int id,
    bool isBot,
    String firstName, {
    String lastName,
    String username,
    String languageCode,
  }) = _User;
}

/// See the [Telegram Bot API documentation on **Chat**][1].
///
/// [1]: https://core.telegram.org/bots/api#chat
@incoming
abstract class Chat {
  int get id;
  String get type;
  @optional
  String get title;
  @optional
  String get username;
  @optional
  String get firstName;
  @optional
  String get lastName;
  @optional
  bool get allMembersAreAdministrators;
  @optional
  ChatPhoto get photo;
  @optional
  String get description;
  @optional
  String get inviteLink;
  @optional
  Message get pinnedMessage;

  Chat._();

  factory Chat(
    int id,
    String type, {
    String title,
    String username,
    String firstName,
    String lastName,
    bool allMembersAreAdministrators,
    ChatPhoto photo,
    String description,
    String inviteLink,
    Message pinnedMessage,
  }) = _Chat;
}

/// See the [Telegram Bot API documentation on **Message**][1].
///
/// [1]: https://core.telegram.org/bots/api#message
/// TODO: add all the other fields
@incoming
abstract class Message {
  int get messageId;
  @optional
  User get from;
  int get date;
  Chat get chat;
  @optional
  User get forwardFrom;
  @optional
  int get forwardFromMessageId;
  @optional
  String get forwardSignature;
  @optional
  int get forwardDate;
  @optional
  Message get replyToMessage;
  @optional
  int get editDate;
  @optional
  String get authorSignature;
  @optional
  String get text;
  @optional
  List<MessageEntity> get entities;
  // TODO: add all the other fields

  Message._();

  factory Message(
    int messageId,
    User from,
    int date,
    Chat chat, {
    User forwardFrom,
    int forwardFromMessageId,
    String forwardSignature,
    int forwardDate,
    Message replyToMessage,
    int editDate,
    String authorSignature,
    String text,
    Iterable<MessageEntity> entities,
  }) = _Message;
}

/// See the [Telegram Bot API documentation on **MessageEntity**][1].
///
/// [1]: https://core.telegram.org/bots/api#messageentity
@incoming
abstract class MessageEntity {
  String get type;
  int get offset;
  int get length;
  @optional
  String get url;
  @optional
  User get user;

  MessageEntity._();

  factory MessageEntity(
    String type,
    int offset,
    int length, {
    String url,
    User user,
  }) = _MessageEntity;
}

/// See the [Telegram Bot API documentation on **PhotoSize**][1].
///
/// [1]: https://core.telegram.org/bots/api#photosize
@incoming
abstract class PhotoSize {
  String get fileId;
  int get width;
  int get height;
  @optional
  int get fileSize;

  PhotoSize._();

  factory PhotoSize(
    String fileId,
    int width,
    int height, {
    int fileSize,
  }) = _PhotoSize;
}

/// See the [Telegram Bot API documentation on **Audio**][1].
///
/// [1]: https://core.telegram.org/bots/api#audio
@incoming
abstract class Audio {
  String get fileId;
  int get duration;
  @optional
  String get performer;
  @optional
  String get title;
  @optional
  String get mimeType;
  @optional
  int get fileSize;

  Audio._();

  factory Audio(
    String fileId,
    int duration, {
    String performer,
    String title,
    String mimeType,
    int fileSize,
  }) = _Audio;
}

/// See the [Telegram Bot API documentation on **Document**][1].
///
/// [1]: https://core.telegram.org/bots/api#document
@incoming
abstract class Document {
  String get fileId;
  @optional
  PhotoSize get thumb;
  @optional
  String get fileName;
  @optional
  String get mimeType;
  @optional
  int get fileSize;

  Document._();

  factory Document(
    String fileId, {
    PhotoSize thumb,
    String fileName,
    String mimeType,
    int fileSize,
  }) = _Document;
}

/// See the [Telegram Bot API documentation on **Video**][1].
///
/// [1]: https://core.telegram.org/bots/api#video
@incoming
abstract class Video {
  String get fileId;
  int get width;
  int get height;
  int get duration;
  @optional
  PhotoSize get thumb;
  @optional
  String get mimeType;
  @optional
  int get fileSize;

  Video._();

  factory Video(
    String fileId,
    int width,
    int height,
    int duration, {
    PhotoSize thumb,
    String mimeType,
    int fileSize,
  }) = _Video;
}

/// See the [Telegram Bot API documentation on **Voice**][1].
///
/// [1]: https://core.telegram.org/bots/api#voice
@incoming
abstract class Voice {
  String get fileId;
  int get duration;
  @optional
  String get mimeType;
  @optional
  int get fileSize;

  Voice._();

  factory Voice(
    String fileId,
    int duration, {
    String mimeType,
    int fileSize,
  }) = _Voice;
}

/// See the [Telegram Bot API documentation on **VideoNote**][1].
///
/// [1]: https://core.telegram.org/bots/api#videonote
@incoming
abstract class VideoNote {
  String get fileId;
  int get length;
  int get duration;
  @optional
  PhotoSize get thumb;
  @optional
  int get fileSize;

  VideoNote._();

  factory VideoNote(
    String fileId,
    int length,
    int duration, {
    PhotoSize thumb,
    int fileSize,
  }) = _VideoNote;
}

/// See the [Telegram Bot API documentation on **Contact**][1].
///
/// [1]: https://core.telegram.org/bots/api#contact
@incoming
abstract class Contact {
  String get phoneNumber;
  String get firstName;
  @optional
  String get lastName;
  @optional
  int get userId;

  Contact._();

  factory Contact(
    String phoneNumber,
    String firstName, {
    String lastName,
    int userId,
  }) = _Contact;
}

/// See the [Telegram Bot API documentation on **Location**][1].
///
/// [1]: https://core.telegram.org/bots/api#location
@incoming
abstract class Location {
  double get longitude;
  double get latitude;

  Location._();

  factory Location(double longitude, double latitude) = _Location;
}

/// See the [Telegram Bot API documentation on **Venue**][1].
///
/// [1]: https://core.telegram.org/bots/api#venue
@incoming
abstract class Venue {
  Location get location;
  String get title;
  String get address;
  @optional
  String get foursquareId;

  Venue._();

  factory Venue(
    Location location,
    String title,
    String address, {
    String foursquareId,
  }) = _Venue;
}

/// See the [Telegram Bot API documentation on **UserProfilePhotos**][1].
///
/// [1]: https://core.telegram.org/bots/api#userprofilephotos
@incoming
abstract class UserProfilePhotos {
  int get totalCount;
  List<List<PhotoSize>> get photos;

  UserProfilePhotos._();

  factory UserProfilePhotos(
    int totalCount,
    Iterable<Iterable<PhotoSize>> photos,
  ) = _UserProfilePhotos;
}

/// See the [Telegram Bot API documentation on **File**][1].
///
/// [1]: https://core.telegram.org/bots/api#file
@incoming
abstract class File {
  String get fileId;
  @optional
  int get fileSize;
  @optional
  String get filePath;

  File._();

  factory File(
    String fileId, {
    int fileSize,
    String filePath,
  }) = _File;
}

/// See the [Telegram Bot API documentation on **CallbackQuery**][1].
///
/// [1]: https://core.telegram.org/bots/api#callbackquery
@incoming
abstract class CallbackQuery {
  String get id;
  User get from;
  String get chatInstance;
  @optional
  Message get message;
  @optional
  String get inlineMessageId;
  @optional
  String get data;
  @optional
  String get gameShortName;

  CallbackQuery._();

  factory CallbackQuery(
    String id,
    User from,
    String chatInstance, {
    Message message,
    String inlineMessageId,
    String data,
    String gameShortName,
  }) = _CallbackQuery;
}

/// See the [Telegram Bot API documentation on **ChatPhoto**][1].
///
/// [1]: https://core.telegram.org/bots/api#chatphoto
@incoming
abstract class ChatPhoto {
  String get smallFileId;
  String get bigFileId;

  ChatPhoto._();

  factory ChatPhoto(
    String smallFileId,
    String bigFileId,
  ) = _ChatPhoto;
}

/// See the [Telegram Bot API documentation on **ChatMember**][1].
///
/// [1]: https://core.telegram.org/bots/api#chatmember
@incoming
abstract class ChatMember {
  User get user;
  String get status;
  @optional
  int get untilDate;
  @optional
  bool get canBeEdited;
  @optional
  bool get canChangeInfo;
  @optional
  bool get canPostMessages;
  @optional
  bool get canEditMessages;
  @optional
  bool get canDeleteMessages;
  @optional
  bool get canInviteUsers;
  @optional
  bool get canRestrictMembers;
  @optional
  bool get canPinMessages;
  @optional
  bool get canPromoteMembers;
  @optional
  bool get canSendMessages;
  @optional
  bool get canSendMediaMessages;
  @optional
  bool get canSendOtherMessages;
  @optional
  bool get canAddWebPagePreviews;

  ChatMember._();

  factory ChatMember(
    User user,
    String status, {
    int untilDate,
    bool canBeEdited,
    bool canChangeInfo,
    bool canPostMessages,
    bool canEditMessages,
    bool canDeleteMessages,
    bool canInviteUsers,
    bool canRestrictMembers,
    bool canPinMessages,
    bool canPromoteMembers,
    bool canSendMessages,
    bool canSendMediaMessages,
    bool canSendOtherMessages,
    bool canAddWebPagePreviews,
  }) = _ChatMember;
}

/// See the [Telegram Bot API documentation on **ResponseParameters**][1].
///
/// [1]: https://core.telegram.org/bots/api#responseparameters
@incoming
abstract class ResponseParameters {
  @optional
  int get migrateToChatId;
  @optional
  int get retry_after;

  ResponseParameters._();

  factory ResponseParameters({
    int migrateToChatId,
    int retry_after,
  }) = _ResponseParameters;
}

/// See the [Telegram Bot API documentation on **InlineQuery**][1].
///
/// [1]: https://core.telegram.org/bots/api#inlinequery
@incoming
abstract class InlineQuery {
  String get id;
  User get from;
  @optional
  Location get location;
  String get query;
  String get offset;

  InlineQuery._();

  factory InlineQuery(
    String id,
    User from,
    Location location,
    String query,
    String offset,
  ) = _InlineQuery;
}

/// See the [Telegram Bot API documentation on **ChosenInlineResult**][1].
///
/// [1]: https://core.telegram.org/bots/api#choseninlineresult
@incoming
abstract class ChosenInlineResult {
  String get resultId;
  User get from;
  String get query;
  @optional
  Location get location;
  @optional
  String get inlineMessageId;

  ChosenInlineResult._();

  factory ChosenInlineResult(
    String resultId,
    User from,
    String query, {
    Location location,
    String inlineMessageId,
  }) = _ChosenInlineResult;
}

/// See the [Telegram Bot API documentation on **ShippingQuery**][1].
///
/// [1]: https://core.telegram.org/bots/api#shippingquery
/// TODO: STUB
@incoming
abstract class ShippingQuery {
  ShippingQuery._();
}

/// See the [Telegram Bot API documentation on **PreCheckoutQuery**][1].
///
/// [1]: https://core.telegram.org/bots/api#precheckoutquery
/// TODO: STUB
@incoming
abstract class PreCheckoutQuery {
  PreCheckoutQuery._();
}

/// See the [Telegram Bot API documentation on **CallbackGame**][1].
///
/// [1]: https://core.telegram.org/bots/api#callbackgame
abstract class CallbackGame {
  CallbackGame._();

  factory CallbackGame() = _CallbackGame;
}

/// See the [Telegram Bot API documentation on **ReplyKeyboardMarkup**][1].
///
/// [1]: https://core.telegram.org/bots/api#replykeyboardmarkup
@outgoing
abstract class ReplyKeyboardMarkup implements ReplyMarkup {
  List<List<KeyboardButton>> get keyboard;
  @optional
  bool get resizeKeyboard;
  @optional
  bool get oneTimeKeyboard;
  @optional
  bool get selective;

  ReplyKeyboardMarkup._();

  factory ReplyKeyboardMarkup(
    Iterable<Iterable<KeyboardButton>> keyboard, {
    bool resizeKeyboard,
    bool oneTimeKeyboard,
    bool selective,
  }) = _ReplyKeyboardMarkup;
}

/// See the [Telegram Bot API documentation on **KeyboardButton**][1].
///
/// [1]: https://core.telegram.org/bots/api#keyboardbutton
@outgoing
abstract class KeyboardButton {
  String get text;
  @optional
  bool get requestContact;
  @optional
  bool get requestLocation;

  KeyboardButton._();

  factory KeyboardButton(
    String text, {
    bool requestContact,
    bool requestLocation,
  }) = _KeyboardButton;
}

/// See the [Telegram Bot API documentation on **ReplyKeyboardRemove**][1].
///
/// [1]: https://core.telegram.org/bots/api#replykeyboardremove
@outgoing
abstract class ReplyKeyboardRemove implements ReplyMarkup {
  @optional
  bool get selective;

  ReplyKeyboardRemove._();

  factory ReplyKeyboardRemove({bool selective}) = _ReplyKeyboardRemove;
}

/// See the [Telegram Bot API documentation on **ForceReply**][1].
///
/// [1]: https://core.telegram.org/bots/api#forcereply
@outgoing
abstract class ForceReply implements ReplyMarkup {
  @optional
  bool get selective;

  ForceReply._();

  factory ForceReply({bool selective}) = _ForceReply;
}

@outgoing
abstract class ReplyMarkup {
  ReplyMarkup._();
}

/// See the [Telegram Bot API documentation on **InlineKeyboardMarkup**][1].
///
/// [1]: https://core.telegram.org/bots/api#inlinekeyboardmarkup
@outgoing
abstract class InlineKeyboardMarkup implements ReplyMarkup {
  List<List<InlineKeyboardButton>> get inlineKeyboard;

  InlineKeyboardMarkup._();

  factory InlineKeyboardMarkup(
          Iterable<Iterable<InlineKeyboardButton>> inlineKeyboard) =
      _InlineKeyboardMarkup;
}

/// See the [Telegram Bot API documentation on **InlineKeyboardButton**][1].
///
/// [1]: https://core.telegram.org/bots/api#inlinekeyboardbutton
@outgoing
abstract class InlineKeyboardButton {
  String get text;
  @optional
  String get url;
  @optional
  String get callbackData;
  @optional
  String get switchInlineQuery;
  @optional
  String get switchInlineQueryCurrentChat;
  @optional
  CallbackGame get callbackGame;
  @optional
  bool get pay;

  InlineKeyboardButton._();

  factory InlineKeyboardButton.createUrl(String text, String url) =>
      new _InlineKeyboardButton(text, url: url);

  factory InlineKeyboardButton.createCallbackData(
          String text, String callbackData) =>
      new _InlineKeyboardButton(text, callbackData: callbackData);

  factory InlineKeyboardButton.createSwitchInlineQuery(
          String text, String switchInlineQuery) =>
      new _InlineKeyboardButton(text, switchInlineQuery: switchInlineQuery);

  factory InlineKeyboardButton.createSwitchInlineQueryCurrentChat(
          String text, String switchInlineQueryCurrentChat) =>
      new _InlineKeyboardButton(text,
          switchInlineQueryCurrentChat: switchInlineQueryCurrentChat);

  factory InlineKeyboardButton.createCallbackGame(
          String text, CallbackGame callbackGame) =>
      new _InlineKeyboardButton(text, callbackGame: callbackGame);

  factory InlineKeyboardButton.createPay(String text) =>
      new _InlineKeyboardButton(text, pay: true);
}

/// See the [Telegram Bot API documentation on **InlineQueryResult**][1].
///
/// [1]: https://core.telegram.org/bots/api#inlinequeryresult
@outgoing
abstract class InlineQueryResult {
  String get id;

  InlineQueryResult._();
}

/// See the [Telegram Bot API documentation on **InlineQueryResultArticle**][1].
///
/// [1]: https://core.telegram.org/bots/api#inlinequeryresultarticle
@outgoing
abstract class InlineQueryResultArticle implements InlineQueryResult {
  String get title;
  InputMessageContent get inputMessageContent;
  @optional
  InlineKeyboardMarkup get replyMarkup;
  @optional
  String get url;
  @optional
  bool get hideUrl;
  @optional
  String get description;
  @optional
  String get thumbUrl;
  @optional
  int get thumbWidth;
  @optional
  int get thumbHeight;

  InlineQueryResultArticle._();

  factory InlineQueryResultArticle(
    String id,
    String title,
    InputMessageContent inputMessageContent, {
    InlineKeyboardMarkup replyMarkup,
    String url,
    bool hideUrl,
    String description,
    String thumbUrl,
    int thumbWidth,
    int thumbHeight,
  }) = _InlineQueryResultArticle;
}

/// See the [Telegram Bot API documentation on **InlineQueryResultGif**][1].
///
/// [1]: https://core.telegram.org/bots/api#inlinequeryresultgif
@outgoing
abstract class InlineQueryResultGif implements InlineQueryResult {
  String get gifUrl;
  @optional
  int get gifWidth;
  @optional
  int get gifHeight;
  @optional
  int get gifDuration;
  String get thumbUrl;
  @optional
  String get title;
  @optional
  String get caption;
  @optional
  InlineKeyboardMarkup get replyMarkup;
  @optional
  InputMessageContent get inputMessageContent;

  InlineQueryResultGif._();

  factory InlineQueryResultGif(
    String id,
    String gifUrl, {
    int gifWidth,
    int gifHeight,
    int gifDuration,
    String thumbUrl,
    String title,
    String caption,
    InlineKeyboardMarkup replyMarkup,
    InputMessageContent inputMessageContent,
  }) = _InlineQueryResultGif;
}

/// See the [Telegram Bot API documentation on **InputMessageContent**][1].
///
/// [1]: https://core.telegram.org/bots/api#inputmessagecontent
@outgoing
abstract class InputMessageContent {
  InputMessageContent._();
}

/// See the [Telegram Bot API documentation on **InputTextMessageContent**][1].
///
/// [1]: https://core.telegram.org/bots/api#inputtextmessagecontent
@outgoing
abstract class InputTextMessageContent implements InputMessageContent {
  String get messageText;
  @optional
  String get parseMode;
  @optional
  bool get disableWebPagePreview;

  InputTextMessageContent._();

  factory InputTextMessageContent.plainText(String messageText) =>
      new _InputTextMessageContent(messageText, null, false);

  factory InputTextMessageContent.markdown(String messageText,
          {bool disableWebPagePreview}) =>
      new _InputTextMessageContent(
          messageText, 'markdown', disableWebPagePreview);

  factory InputTextMessageContent.html(String messageText,
          {bool disableWebPagePreview}) =>
      new _InputTextMessageContent(messageText, 'html', disableWebPagePreview);
}

/// See the [Telegram Bot API documentation on **InputLocationMessageContent**][1].
///
/// [1]: https://core.telegram.org/bots/api#inputlocationmessagecontent
@outgoing
abstract class InputLocationMessageContent implements InputMessageContent {
  double get longitude;
  double get latitude;

  InputLocationMessageContent._();

  factory InputLocationMessageContent(
    double longitude,
    double latitude,
  ) = _InputLocationMessageContent;
}

/// See the [Telegram Bot API documentation on **InputVenueMessageContent**][1].
///
/// [1]: https://core.telegram.org/bots/api#inputvenuemessagecontent
@outgoing
abstract class InputVenueMessageContent implements InputMessageContent {
  double get longitude;
  double get latitude;
  String get title;
  String get address;
  @optional
  String get foursquareId;

  InputVenueMessageContent._();

  factory InputVenueMessageContent(
    double longitude,
    double latitude,
    String title,
    String address, {
    String foursquareId,
  }) = _InputVenueMessageContent;
}

/// See the [Telegram Bot API documentation on **InputContactMessageContent**][1].
///
/// [1]: https://core.telegram.org/bots/api#inputcontactmessagecontent
@outgoing
abstract class InputContactMessageContent implements InputMessageContent {
  String get phoneNumber;
  String get firstName;
  @optional
  String get lastName;

  InputContactMessageContent._();

  factory InputContactMessageContent(
    String phoneNumber,
    String firstName, {
    String lastName,
  }) = _InputContactMessageContent;
}

/// Commands can be sent bot the [TelegramBot].
///
/// List of available commands:
/// * [GetUpdates]
/// * [GetMe]
/// * [SetWebhook]
/// * [DeleteWebhook]
/// * [GetWebhookInfo]
/// * [SendMessage]
/// * [ForwardMessage]
/// * [AnswerInlineQuery]
///
abstract class Command<T> {
  String get method;

  Command._();

  T convert(Object result);
}

/// See the [Telegram Bot API documentation on **getUpdates**][1].
///
/// [1]: https://core.telegram.org/bots/api#getupdates
@command
abstract class GetUpdates implements Command<List<Update>> {
  @optional
  int get offset;
  @optional
  int get limit;
  @optional
  int get timeout;
  @optional
  List<String> get allowedUpdates;

  GetUpdates._();

  factory GetUpdates({
    int offset,
    int limit,
    int timeout,
    Iterable<String> allowedUpdates,
  }) = _GetUpdates;
}

/// See the [Telegram Bot API documentation on **getMe**][1].
///
/// [1]: https://core.telegram.org/bots/api#getme
@command
abstract class GetMe implements Command<User> {
  GetMe._();

  factory GetMe() = _GetMe;
}

/// See the [Telegram Bot API documentation on **setWebhook**][1].
///
/// [1]: https://core.telegram.org/bots/api#setwebhook
@command
abstract class SetWebhook implements Command<bool> {
  String get url;
  @optional
  InputFile get certificate;
  @optional
  int get maxConnections;
  @optional
  List<String> get allowedUpdates;

  SetWebhook._();

  factory SetWebhook(
    String url, {
    InputFile certificate,
    int maxConnections,
    Iterable<String> allowedUpdates,
  }) = _SetWebhook;
}

/// See the [Telegram Bot API documentation on **deleteWebhook**][1].
///
/// [1]: https://core.telegram.org/bots/api#deletewebhook
@command
abstract class DeleteWebhook implements Command<bool> {
  DeleteWebhook._();

  factory DeleteWebhook() = _DeleteWebhook;
}

/// See the [Telegram Bot API documentation on **getWebhookInfo**][1].
///
/// [1]: https://core.telegram.org/bots/api#getwebhookinfo
@command
abstract class GetWebhookInfo implements Command<WebhookInfo> {
  GetWebhookInfo._();

  factory GetWebhookInfo() = _GetWebhookInfo;
}

/// See the [Telegram Bot API documentation on **sendMessage**][1].
///
/// [1]: https://core.telegram.org/bots/api#sendmessage
@command
abstract class SendMessage implements _Command<Message> {
  Object get chatId;
  String get text;
  @optional
  String get parseMode;
  @optional
  bool get disableWebPagePreview;
  @optional
  bool get disableNotification;
  @optional
  int get replyToMessageId;
  @optional
  ReplyMarkup get replyMarkup;

  SendMessage._();

  factory SendMessage.plainText(
    Object chatId,
    String text, {
    bool disableWebPagePreview,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) =>
      new _SendMessage(
        chatId,
        text,
        null,
        disableWebPagePreview: disableWebPagePreview,
        disableNotification: disableNotification,
        replyToMessageId: replyToMessageId,
        replyMarkup: replyMarkup,
      );

  factory SendMessage.markdown(
    Object chatId,
    String text, {
    bool disableWebPagePreview,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) =>
      new _SendMessage(
        chatId,
        text,
        'markdown',
        disableWebPagePreview: disableWebPagePreview,
        disableNotification: disableNotification,
        replyToMessageId: replyToMessageId,
        replyMarkup: replyMarkup,
      );

  factory SendMessage.html(
    Object chatId,
    String text, {
    bool disableWebPagePreview,
    bool disableNotification,
    int replyToMessageId,
    ReplyMarkup replyMarkup,
  }) =>
      new _SendMessage(
        chatId,
        text,
        'html',
        disableWebPagePreview: disableWebPagePreview,
        disableNotification: disableNotification,
        replyToMessageId: replyToMessageId,
        replyMarkup: replyMarkup,
      );
}

/// See the [Telegram Bot API documentation on **forwardMessage**][1].
///
/// [1]: https://core.telegram.org/bots/api#forwardmessage
@command
abstract class ForwardMessage implements Command<Message> {
  Object get chatId;
  Object get fromChatId;
  @optional
  bool get disableNotifications;
  int get messageId;

  ForwardMessage._();

  factory ForwardMessage(
    Object chatId,
    Object fromChatId,
    int messageId, {
    bool disableNotifications,
  }) = _ForwardMessage;
}

/// See the [Telegram Bot API documentation on **answerInlineQuery**][1].
///
/// [1]: https://core.telegram.org/bots/api#answerinlinequery
@command
abstract class AnswerInlineQuery implements Command<bool> {
  String get inlineQueryId;
  List<InlineQueryResult> get results;
  @optional
  int get cacheTime;
  @optional
  bool get isPersonal;
  @optional
  String get nextOffset;
  @optional
  String get switchPmText;
  @optional
  String get switchPmParameter;

  AnswerInlineQuery._();

  factory AnswerInlineQuery(
    String inlineQueryId,
    Iterable<InlineQueryResult> results, {
    int cacheTime,
    bool isPersonal,
    String nextOffset,
    String switchPmText,
    String switchPmParameter,
  }) = _AnswerInlineQuery;
}

// Copyright (c) 2017, TOPdesk. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

import '../impl/annotation.dart' as annotation;

/// This field might be null.
const Object optional = annotation.optional;

/// Instances are created by the [TelegramBot].
const Object incoming = annotation.incoming;

/// Instances are sent by the [TelegramBot].
const Object outgoing = annotation.outgoing;

/// Instances can be processed by the [TelegramBot].
const Object command = annotation.command;

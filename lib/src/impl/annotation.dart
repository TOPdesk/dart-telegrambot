// Copyright (c) 2017, TOPdesk. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a MIT-style
// license that can be found in the LICENSE file.

const Object optional = const _Optional();
const Object incoming = const _Category('incoming');
const Object outgoing = const _Category('outgoing');
const Object command = const _Category('command');

class _Optional {
  const _Optional();
}

class _Category {
  final String type;
  const _Category(this.type);

  @override
  String toString() => type;

  @override
  int get hashCode => type.hashCode;

  @override
  bool operator ==(dynamic other) =>
      (other is _Category) && type == (other as _Category).type;
}

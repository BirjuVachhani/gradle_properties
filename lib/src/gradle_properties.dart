/*
 * Copyright (c) 2020, Birju Vachhani
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *  1. Redistributions of source code must retain the above copyright notice,
 *     this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 *  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 *  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 *  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 *  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 *  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 *  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 *  POSSIBILITY OF SUCH DAMAGE.
 */

// Author: Birju Vachhani
// Created Date: August 17, 2020

import 'dart:io';

/// Entry point of this library. It allows to read/write properties files,
/// access properties, and modify properties.
class GradleProperties {
  final Map<String, String> _props;
  final File? _file;

  /// loads given properties from given file and returns a future that can be
  /// awaited.
  static Future<GradleProperties?> fromFile(File file) async {
    try {
      final lines = file.readAsLinesSync();
      final props = {
        for (final line in lines) line.split('=')[0]: line.split('=')[1]
      };
      return GradleProperties._(props, file);
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return null;
    }
  }

  /// loads given properties from given file path and returns a future that
  /// can be awaited
  static Future<GradleProperties?> fromPath(String path) =>
      GradleProperties.fromFile(File(path));

  /// loads properties from given map
  GradleProperties.fromMap(this._props) : _file = null;

  GradleProperties._(this._props, [this._file]);

  /// allows to save properties to a file.
  /// If a file is provided at the time of initialization that is if
  /// [GradleProperties.fromFile] or [GradleProperties.fromPath] is used to
  /// create instance, then that file will be used by default to write back on
  /// it.
  ///
  /// To save properties to a different file, pass [file] param. [file] has
  /// precedence over source file.
  ///
  /// throws [FileSystemException] if no file is provided.
  Future<void> save([File? file]) async {
    final outputFile = file ?? _file;
    if (outputFile == null) {
      throw FileSystemException('Properties file not found');
    }
    final sink = outputFile.openWrite();
    _props.forEach((key, value) => sink.writeln('$key=$value'));
    await sink.close();
  }

  /// allows to access properties like a map
  String? operator [](String key) => _props[key];

  /// allows to set properties like a map do
  void operator []=(String key, String value) => _props[key] = value;

  /// returns an iterable of keys present in properties
  Iterable<String> get keys => _props.keys;

  /// returns an iterable of values present in properties
  Iterable<String> get values => _props.values;

  /// adds all the entries from [map] to properties
  void addAll(Map<String, String> map) => _props.addAll(map);

  /// only puts a key if it is absent. This will not change the value of key
  /// if already exists in properties
  void putIfAbsent(String key, String value) =>
      _props.putIfAbsent(key, () => value);

  /// returns a map of properties.
  Map<String, String> get properties =>
      _props.map((key, value) => MapEntry(key, value));

  /// checks whether given key is in properties or not
  bool contains(String key) => _props.containsKey(key);
}

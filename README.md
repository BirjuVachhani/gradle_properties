# Gradle Properties

A dart package allowing to easily work with Gradle properties files.

[![Tests](https://github.com/BirjuVachhani/gradle_properties/workflows/Tests/badge.svg?branch=master)](https://github.com/BirjuVachhani/gradle_properties/actions) [![Code Quality](https://github.com/BirjuVachhani/gradle_properties/workflows/Code%20Quality/badge.svg?branch=master)](https://github.com/BirjuVachhani/gradle_properties/actions) [![Codecov](https://img.shields.io/codecov/c/github/birjuvachhani/gradle_properties.svg)](https://codecov.io/gh/birjuvachhani/gradle_properties) [![gradle_properties](https://img.shields.io/pub/v/gradle_properties?label=gradle_properties)](https://pub.dev/packages/gradle_properties)

## Usage

To use this plugin, add path_provider as a [dependency in your pubspec.yaml file.](https://flutter.dev/docs/development/packages-and-plugins/using-packages)

##### Example

```dart
// load properties file
final properties = await GradleProperties.fromFile(File('gradle.properties'));

// use extension to load properties
await File('gradle.properties').readProperties();

// access properties with keys
properties['email'];

// modify a property
properties['first_name'] = 'Birju';

// saves changes back to the same file
properties.save();

// saves changes to a different file
properties.save(File('test.properties'));
```

See `example.dart` linked example for more info.



### Pull Request
To generate a pull request, please consider following [Pull Request Template](https://github.com/BirjuVachhani/locus-android/blob/master/PULL_REQUEST_TEMPLATE.md).



## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/birjuvachhani/gradle_properties/issues



Code of Conduct
---
[Code of Conduct](https://github.com/BirjuVachhani/locus-android/blob/master/CODE_OF_CONDUCT.md)



## Contribution

You are most welcome to contribute to this project!

Please have a look at [Contributing Guidelines](https://github.com/BirjuVachhani/locus-android/blob/master/CONTRIBUTING.md), before contributing and proposing a change.



#### Did you find this package helpful?

Show some love and support by starring the [repository](https://github.com/birjuvachhani/gradle_properties).

Or You can

<a href="https://www.buymeacoffee.com/birjuvachhani" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-blue.png" alt="Buy Me A Coffee" style="height: 51px !important;width: 217px !important;" ></a>



## License

```
Copyright (c) 2020, Birju Vachhani
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

```



# 1.0.2

- Allow parsing empty lines in properties file by [@PeregrineFalcon](https://github.com/PeregrineFalcon)
- Improve test coverage.

# 1.0.1

- Bump up minimum Dart SDK version to 3.0.
- Fix parsing crash when there is a comment in the properties file.
- Improve parsing to detect invalid lines and values.
- Introduce `GradleProperties.parse` and `GradleProperties.tryParse` constructors.

# 1.0.0

- Migrated to null safety.

## 0.1.1

- Read/Write gradle properties files
- modify values in gradle properties files
- Extension to treat a File as properties file and load it
- Added tests
- Access properties through overloaded map operators

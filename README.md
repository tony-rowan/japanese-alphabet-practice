# Japanese Alphabet Practice

A web application designed to help you read Hiragana and Katakana.

## Development

### Requirements

The ruby and nodejs versions are managed with asdf. Once it is installed,
installing the correct versions is a simple as running

```bash
$ asdf install
```

### Setup

The entire application runs in memory so there is no database, meaning
setup is as simple as installing gems, node packages and starting the server.

```bash
$ bin/setup
$ bin/rails s
```

### Testing

Tests run using RSpec, with Capybara driving feature tests. To run all tests
simply run

```bash
$ bin/rspec
```

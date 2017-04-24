# Wisper::Celluloid

Provides [Wisper](https://github.com/krisleech/wisper) with asynchronous event
publishing using [Celluloid](https://github.com/celluloid/celluloid) actors.

[![Gem Version](https://badge.fury.io/rb/wisper-celluloid.png)](http://badge.fury.io/rb/wisper-celluloid)
[![Code Climate](https://codeclimate.com/github/krisleech/wisper-celluloid.png)](https://codeclimate.com/github/krisleech/wisper-celluloid)
[![Build Status](https://travis-ci.org/krisleech/wisper-celluloid.png?branch=master)](https://travis-ci.org/krisleech/wisper-celluloid)
[![Coverage Status](https://coveralls.io/repos/krisleech/wisper-celluloid/badge.png?branch=master)](https://coveralls.io/r/krisleech/wisper-celluloid?branch=master)

## Installation

```ruby
gem 'wisper-celluloid'
```

## Usage

```ruby
my_publisher.subscribe(MyListener.new, async: true)
```

The listener is transparently turned in to a Celluloid Actor.

Please refer to [Celluloid](https://github.com/celluloid/celluloid/wiki)
for more information, particularly the
[Gotchas](https://github.com/celluloid/celluloid/wiki/Gotchas).

## Compatibility

Tested with 2.x, JRuby and Rubinius.
See the [build status](https://travis-ci.org/krisleech/wisper-async) for details.

## Contributing

Yes please, either submit a PR or open an issue first to discuss your thoughts.

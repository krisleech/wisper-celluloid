# Wisper::Celluloid

Note: This will not work until Wisper > 1.4.0 is released.

Provides async event broadcasting to
[Wisper](https://github.com/krisleech/wisper) gem using
[Celluloid](https://github.com/celluloid/celluloid).

## Installation

```ruby
gem 'wisper-celluloid'
```

## Usage

```ruby
my_publisher.subscribe(MyListener.new, async: true)
```

## Contributing

Please send a Pull Request.

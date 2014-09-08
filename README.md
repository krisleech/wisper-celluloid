# Wisper::Celluloid [WIP]

Provides async event broadcasting to
[Wisper](https://github.com/krisleech/wisper) gem using
[Celluloid](https://github.com/celluloid/celluloid).

## Installation

    gem 'wisper-celluloid'

## Usage

You just need to specifiy the `broadcaster` option when subscribing:

```ruby
my_publisher.subscribe(MyListener.new, broadcaster: Wisper::Celluloid::CelluloidBroadcaster.new)
```

## Contributing

Please send a Pull Request.

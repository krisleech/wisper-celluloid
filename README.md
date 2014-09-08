# Wisper::Celluloid [WIP]

Provides async event broadcasting to Wisper gem using
[Celluloid](https://github.com/celluloid/celluloid).

## Installation

    gem 'wisper-celluloid'

## Usage

```ruby
my_publisher.subscribe(MyListener.new, broadcaster: Wisper::Celluloid::CelluloidBroadcaster.new)
```

## Contributing

Please send a Pull Request.

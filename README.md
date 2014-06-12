# Wisper::Celluloid [WIP]

Provides async event broadcasting to Wisper gem using Celluloid.

## Installation

    gem 'wisper-celluloid'

## Usage

```ruby
my_publisher.add_listener(MyListener.new, invoker: Wisper::Invokers::Celluloid.new)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/wisper-celluloid/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# LoadRails

LoadRails is a Gem that helps you add the Rails Environment to your project.

It works from any directory inside a Rails project by traversing the tree until
it finds the system root.

### Example usage:
```ruby
require 'load_rails'

LoadRails.load

```

## Goals

I created this Gem because I was creating a CLI to interact with Rails that was
not a Rails Plugin. I saw different patterns on how to include the Rails ENV and
figured I would make a standard approach I could reuse simply.


### Contribute

Pull requests and or feedback are welcome.

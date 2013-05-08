# Enviable

Enviable is a Ruby gem that acts as a wrapper for ENV.

## Usage

In your local env:

```
ELASTICSEARCH_URL=http://www.foo.bar
FACEBOOK_APP_ID=123456789
```

In Ruby:
```
Environment.facebook_app_id
# => "123456789"
Environment.elasticsearch_url
# => "http://www.foo.bar"
Environment.eLaStIcSeArCh_uRl
# => "http://www.foo.bar"
Environment.merge!(elasticsearch_url: "http://www.baz.bat")
# => nil
Environment.elasticsearch_url
# => "http://www.baz.bat"
Environment.clear!
# => nil
Environment.elasticsearch_url
# => "http://www.foo.bar"
```

## Installation

Add this line to your application's Gemfile:

    gem 'enviable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install enviable

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

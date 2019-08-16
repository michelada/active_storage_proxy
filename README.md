# ActiveStorageProxy
Engine for adding support to ActiveStorage based on this [gist](https://gist.github.com/palkan/e3a272f612d37b6e24aa1c66fe7cc3cb)

## Usage
```ruby
rails_proxy_blob_url(signed_id: attachment.signed_id, filename: attachment.filename)`
```

```ruby
variant = attachment.variant(:medium)
rails_proxy_blob_url(signed_id: attachment.signed_id, variation_key: variant.variation.key, filename: variant.filename)
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem "active_storage_proxy", github: "michelada/active_storage_proxy"
```

And then execute:
```bash
$ bundle
```

```ruby
# config/environments/production.rb
config.active_storage_proxy.proxy_urls_expire_in = 1.year
config.active_storage_proxy.proxy_urls_public = true
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

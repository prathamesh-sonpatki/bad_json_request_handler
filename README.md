# BadJsonRequestHandler

![Gem Version][gem-version-img]

You have a Rails API endpoint which expects JSON request payload. But some clients
send invalid JSON requests.
This typically results in following error.

```
ActionDispatch::Http::Parameters::ParseError: 767: unexpected token at '{ event: { seconds: }}'
```

This results in a 500 error from the server. But client does not get an idea that the
request payload was invalid. What if you can instead respond with 400 Bad Request response
which clearly tells the client that the request is invalid. They may start sending valid
requests going forward!

That's where this gem comes into the picture. It captures the `Parameters::ParseError`
and returns a Bad Request response back. Once you use the initialize from this gem,
the response will be as follows.

```
HTTP 400
{"errors"=>{"message"=>"Invalid request payload: 767: unexpected token at '{ event: { seconds: }}'"}}
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bad_json_request_handler'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install bad_json_request_handler

## Usage

This gem automatically includes `BadJsonRequestHandler` middleware in your Rails application
by adding it to the middleware stack as follows.

```rb
Rails.application.config.middleware.insert_after ActionDispatch::DebugExceptions, BadJsonRequestHandler::Middleware
```
## Development

After checking out the repo, run `rake test` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/prathamesh-sonpatki/bad_json_request_handler. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/prathamesh-sonpatki/bad_json_request_handler/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the BadJsonRequestHandler project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/prathamesh-sonpatki/bad_json_request_handler/blob/master/CODE_OF_CONDUCT.md).

[gem-version-img]: https://badge.fury.io/rb/bad_json_request_handler.svg

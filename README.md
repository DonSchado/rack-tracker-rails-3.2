# just a test app for rack-tracker

*Gemfile:*

```
  gem 'rack-tracker', '~> 0.2.6'
```

*config/application.rb*

```
  config.middleware.use(Rack::Tracker) do
    handler :google_analytics, { tracker: 'FancyGoogleID', ecommerce: true}
    handler :facebook, { custom_audience: 'my-audience' }
  end
```

*app/controllers/foos_controller.rb*

```
  def index
    @foos = Foo.all

    tracker do |t|
      t.google_analytics :send, { type: 'event', category: 'foo', action: 'bar', label: 'baz', value: '123456' }
      t.google_analytics :ecommerce, { type: 'addItem', id: '1234', affiliation: 'Acme Clothing', revenue: '11.99', shipping: '5', tax: '1.29' }
      t.facebook :track, { id: '123456789', value: 1, currency: 'EUR' }
    end
  end
```

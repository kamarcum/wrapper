## wrapper

[![Build Status](https://secure.travis-ci.org/ingemar/wrapper.png)](http://travis-ci.org/ingemar/wrapper)

this is a minimalistic implementation of a object wrapper intended to use for things like building a presenter layer in Rails.
The goal with presenters is to separate view logic from the model and avoid using view helper modules.

## Usage

Normal procedure. Stick the gem in your `Gemfile` and `bundle`.

```
  gem 'wrapper'
```

Then just include `Wrapper` in your presenter class. To wrap your resources simply call `.wrap` with your presenter class. If you pass it a collection, you'll get a collection back with each resource neatly wrapped. If you pass it a single resource you'll get that back, neatly fixed ready for the grand stage.

Add new methods or override existing ones for your view in your presenter class. All public instance methods defined in the original model are available for your presenter through `#method_missing` and `#respond_to?`.

You can always get the original resource object through `#resource` and it's class constant with `#model`.

It's considered good behaviour to place your presenters in `./app/presenters/`

## Caveats

If you need to compare a wrapped resource with itself, the wrapped resource has to be first in the statement (i.e. `user == current_user`).

## Extended examples

See `EXAMPLES`

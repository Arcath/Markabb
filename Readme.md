# Markabb
[RDoc](http://rubydoc.info/github/Arcath/Markabb/master/frames) | [www](http://markabb.arcath.net) | [Gempage](http://rubygems.org/gems/markabb) | [![Status](https://secure.travis-ci.org/Arcath/Markabb.png?branch=master)](http://travis-ci.org/Arcath/Markabb)

Markabb is an all ruby BBCode parser which can be fully configured and extended.

To get the latest stable version install the gem by adding 

    gem 'markabb'

to your Gemfile

## Usage

Before you can use Markabb you need to configure it. To do this create an intializer (config/intializers in rails) and pass a block to Markabb.configure like this:

    Markabb.configure do |c|
    end

`c` is an instance of Markabb::Config which is used by Markabb when ever you parse a string. You can pass any config options you want here.

To parse a string simply call `.markabb` on it e.g.

    "[b]foo[/b] [i]bar[/i]".markabb # => <b>foo</b><i>bar</i>

If you need to configure Markabb for a one off parse e.g. if you want to disable links when parsing a forum post etc... to do that pass a block to `Markabb.parse`

    Markabb.parse "[b]foo[/b] [i]bar[/i]" do |c|
        c.disable_bold = true
    end # => [b]foo[/b] <i>bar</i>

See the [Wiki](https://github.com/Arcath/Markabb/wiki) for instructions on Markabbs more advanced features like custom tags, callbacks and syntax highlighting.

## Developing & Testing

Makrabb uses RSpec for its tests, to run them just run `rspec` in the root directory.

Please make sure that the tests pass before you submit a pull request and if you add any new features please add the tests for them.

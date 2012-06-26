# Text Weaver
  "Weaves any string into any text"

Weaves html tags (or really anything) into a text at given
opening or closing positions. Inserted tags need to be aligned
(that is non-overlapping) in order to be inserted.

Opening and closing tags are inserted and kept in order.

Inspired by Ted Nelsons project Xanadu.

## Usage

First require it.

  $ irb

  > require 'rubygems'
  > require 'textweaver'

You can create a TextWeaver with any text.

  > w = TextWeaver.new("abcde")

Then add some openings and closings.

  > w.add_opening(1, "(")
  > w.add_closing(4, ")")

  > w.weave 
  => "a(bcd)e"

Possibly with additionally some different tag-types.

  > w.next_set

  > w.add_opening(1, "<")
  > w.add_closing(4, ">")

  > w.weave 
  => "a(<bcd>)e"

## Installation

Add this line to your application's Gemfile:

    gem 'textweaver'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install textweaver

Feel free to report issues and to ask questions. For the latest news
on TextWeaver:

* http://foundation.logilogi.org/tags/TextWeaver

## Contributing

If you wish to contribute, please create a pull-request and remember
to update the corresponding unit test(s).

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

= Text Weaver -- Weaves tags into text

Weaves html tags (or really anything) into a text at given
opening or closing positions. Inserted tags need to be aligned
(that is non-overlapping) in order to be inserted.

Opening and closing tags are inserted and kept in order.

TextWeaver is a library by the LogiLogi Foundation, extracted from
http://www.logilogi.org (http://foundation.logilogi.org).

== Usage

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

== Download

The latest version of Text Weaver can be found at:

* http://rubyforge.org/frs/?group_id=7566

Documentation can be found at:

* http://textweaver.rubyforge.org

== Installation

You can install Text Weaver with the following command:

  % [sudo] gem install textweaver

Or from its distribution directory with:

  % [sudo] ruby install.rb

== License

Text Weaver is released under the GNU Affero GPL licence.

* http://www.fsf.org/licensing/licenses/agpl-3.0.html

== Support

The Text Weaver homepage is http://textweaver.rubyforge.org.

For the latest news on Text Weaver:

* http://foundation.logilogi.org/tags/TextWeaver

Feel free to submit commits or feature requests. If you send a patch,
remember to update the corresponding unit tests.

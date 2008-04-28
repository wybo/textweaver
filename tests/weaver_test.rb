#! /usr/bin/env ruby
#--#
# Copyright: (c) 2006-2008 The LogiLogi Foundation <foundation@logilogi.org>
#
# License:
#   This file is part of the Weaver Library. Weaver is Free Software.
#   You can run/distribute/modify Weaver under the terms of the GNU
#   Affero General Public License version 3. The Affero GPL states
#   that running a modified version or a derivative work also requires
#   you to make the sourcecode of that work available to everyone that
#   can interact with it. We chose the Affero GPL to ensure that
#   Weaver remains open and libre (doc/LICENSE.txt contains the full
#   text of the legally binding license).
#++#

$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/../lib") if __FILE__ == $0

require 'weaver'
require 'test/unit'

class WeaverTest < Test::Unit::TestCase
  ### Initialization

  def test_initialize
    w = Weaver.new("kukadopalala")
    assert_equal "kukadopalala", w.text
  end

  ### Methods

  def test_next_set
    w = Weaver.new("abc")
    w.add_opening(1, ";")
    w.next_set
    w.add_opening(1, ":")
    assert_equal "a;:bc", w.weave
  end

  def test_add_opening
    w = Weaver.new("abc")
    w.add_opening(1, "1")
    w.next_set
    w.add_opening(1, "2")
    assert_equal "a12bc", w.weave
  end

  def test_add_closing
    w = Weaver.new("abc")
    w.add_closing(1, "1")
    w.next_set
    w.add_closing(1, "2")
    assert_equal "a21bc", w.weave
  end

  def test_weave
    # simple
    w = Weaver.new("abcde")
    w.add_opening(1, "(")
    w.add_closing(4, ")")
    w.next_set
    w.add_opening(1, "<")
    w.add_closing(4, ">")
    assert_equal "a(<bcd>)e", w.weave

    # side by side
    w2 = Weaver.new("abcdef")
    w2.add_opening(1, "(")
    w2.add_closing(3, ")")
    w2.add_opening(3, "<")
    w2.add_closing(5, ">")
    assert_equal "a(bc)<de>f", w2.weave
  end

  def test_exceptions
    w = Weaver.new("abc")

    assert_raise(Weaver::Error) {
      w.add_closing(-1, "a")
    }

    assert_raise(Weaver::Error) {
      w.add_opening(4, "a")
    }
  end
end

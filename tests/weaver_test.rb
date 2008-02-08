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
  def test_initialize
    w = Weaver.new("kukadopalala")
    assert_equal "kukadopalala", w.text
  end

  def test_next_set
    w = Weaver.new("abc")
    w.add_opening(1, "a")
    w.next_set
    w.add_opening(1, "a")
    assert w.weave
  end

  def test_insert_opening
    w = Weaver.new("abc")
    w.add_opening(1, "k")
    assert_equal "akbc", w.weave
  end

  def test_insert_closing
    w = Weaver.new("abc")
    w.add_closing(1, "k")
    assert_equal "akbc", w.weave
  end

  def test_weave
    w = Weaver.new("abcde")
    w.add_opening(1, "(")
    w.add_closing(4, ")")
    w.next_set
    w.add_opening(1, "<")
    w.add_closing(4, ">")
    assert_equal "a<(bcd)>e", w.weave
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

#--#
# Copyright: (c) 2006-2009 The LogiLogi Foundation <foundation@logilogi.org>
#
# License:
#   This file is part of the TextWeaver Library. TextWeaver is Free 
#   Software. You can run/distribute/modify TextWeaver under the terms 
#   of the GNU Lesser General Public License version 3. This license
#   states that you can use TextWeaver in applications that are not Free 
#   Software but TextWeaver itself remains Free Software. (LICENSE contains 
#   the full text of the legally binding license).
#++#

require File.dirname(__FILE__) + '/test_helper.rb'

class TextWeaverTest < Test::Unit::TestCase
  ### Initialization

  def test_initialize
    w = TextWeaver.new("kukadopalala")
    assert_equal "kukadopalala", w.text
  end

  ### Methods

  def test_next_set
    w = TextWeaver.new("abc")
    w.add_opening(1, ";")
    w.next_set
    w.add_opening(1, ":")
    assert_equal "a;:bc", w.weave
  end

  def test_add_opening
    w = TextWeaver.new("abc")
    w.add_opening(1, "1")
    w.next_set
    w.add_opening(1, "2")
    assert_equal "a12bc", w.weave
  end

  def test_add_closing
    w = TextWeaver.new("abc")
    w.add_closing(1, "1")
    w.next_set
    w.add_closing(1, "2")
    assert_equal "a21bc", w.weave
  end

  def test_weave
    # simple
    w = TextWeaver.new("abcde")
    w.add_opening(1, "(")
    w.add_closing(4, ")")
    w.next_set
    w.add_opening(1, "<")
    w.add_closing(4, ">")
    assert_equal "a(<bcd>)e", w.weave

    # side by side
    w2 = TextWeaver.new("abcdef")
    w2.add_opening(1, "(")
    w2.add_closing(3, ")")
    w2.add_opening(3, "<")
    w2.add_closing(5, ">")
    assert_equal "a(bc)<de>f", w2.weave

    # multi weave
    w3 = TextWeaver.new("abcde")
    w3.add_opening(1, "(")
    w3.add_closing(4, ")")
    assert_equal "a(bcd)e", w3.weave

    w3.next_set
    w3.add_opening(1, "<")
    w3.add_closing(4, ">")
    assert_equal "a(<bcd>)e", w3.weave
  end

  def test_exceptions
    w = TextWeaver.new("abc")

    assert_raise(TextWeaver::Error) {
      w.add_closing(-1, "a")
    }

    assert_raise(TextWeaver::Error) {
      w.add_opening(4, "a")
    }
  end
end

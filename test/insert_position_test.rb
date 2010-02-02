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

class InsertPositionTest < Test::Unit::TestCase
  ### Initialization

  def test_initialize
    i_p = TextWeaver::InsertPosition.new(10,2,"mooo")
    assert_equal 10, i_p.position
    assert_equal 2, i_p.set
    assert_equal "mooo", i_p.text
  end

  ### Methods

  def test_compare
    # positions
    assert TextWeaver::InsertPosition.new(10,2,"a") > TextWeaver::InsertPosition.new(9,2,"a")
    assert TextWeaver::InsertPosition.new(9,2,"a") < TextWeaver::InsertPosition.new(10,2,"a")

    # sets
    assert TextWeaver::InsertPosition.new(0,2,"a") > TextWeaver::InsertPosition.new(0,1,"a")
    assert TextWeaver::InsertPosition.new(0,1,"a") < TextWeaver::InsertPosition.new(0,2,"a")
  end

  def test_exceptions
    assert_raise(TextWeaver::Error) {
      TextWeaver::InsertPosition.new(-1,2,"a")
    }

    assert_raise(TextWeaver::Error) {
      TextWeaver::InsertPosition.new(10,2,"a") > TextWeaver::InsertPosition.new(10,2,"a")
    }
  end
end

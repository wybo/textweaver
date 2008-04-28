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

require 'weaver/insert_position'
require 'test/unit'

class InsertPositionTest < Test::Unit::TestCase
  ### Initialization

  def test_initialize
    i_p = Weaver::InsertPosition.new(10,2,"mooo")
    assert_equal 10, i_p.position
    assert_equal 2, i_p.set
    assert_equal "mooo", i_p.text
  end

  ### Methods

  def test_compare
    # positions
    assert Weaver::InsertPosition.new(10,2,"a") > Weaver::InsertPosition.new(9,2,"a")
    assert Weaver::InsertPosition.new(9,2,"a") < Weaver::InsertPosition.new(10,2,"a")

    # sets
    assert Weaver::InsertPosition.new(0,2,"a") > Weaver::InsertPosition.new(0,1,"a")
    assert Weaver::InsertPosition.new(0,1,"a") < Weaver::InsertPosition.new(0,2,"a")
  end

  def test_exceptions
    assert_raise(Weaver::Error) {
      Weaver::InsertPosition.new(-1,2,"a")
    }

    assert_raise(Weaver::Error) {
      Weaver::InsertPosition.new(10,2,"a") > Weaver::InsertPosition.new(10,2,"a")
    }
  end
end

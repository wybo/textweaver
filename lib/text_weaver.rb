#--#
# Copyright: (c) 2008 The LogiLogi Foundation <foundation@logilogi.org>
#
# License:
#   This file is part of the TextWeaver Library. TextWeaver is Free 
#   Software. You can run/distribute/modify TextWeaver under the terms 
#   of the GNU Affero General Public License version 3. The Affero GPL
#   states that running a modified version or a derivative work also
#   requires you to make the sourcecode of that work available to 
#   everyone that can interact with it. We chose the Affero GPL to
#   ensure that TextWeaver remains open and libre (doc/LICENSE.txt 
#   contains the full text of the legally binding license).
#++#
#
# TextWeaver allows one to insert tags in a running text.
#
# Openings are added before the given character-position, while
# closings are added after the given character-position.
#
# You should only add stuff to the weaver via add_opening and
# add_closing.

$:.unshift(File.dirname(__FILE__)) unless
    $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

class TextWeaver
  ### Attributes
  
  attr_accessor :text
end

require 'text_weaver/error'
require 'text_weaver/insert_position'

class TextWeaver
  ### Constructors

  # Initializes a new TextWeaver.
  #
  def initialize(text)
    self.text = text
    self.clear
  end

  ### Methods

  # Increases the set-counter...
  #
  # (the thing that keeps tag-types apart)
  #
  def next_set
    @set += 1
  end

  # Adds stuff to the weaver.
  #
  # This makes sure that different kinds of tags are kept together
  # (opening and closing-tags in order. If <b></b> are set 1, and
  # <i></i> set 2, then overlapping <b>'s and <i>'s are kept in
  # order, so <b>the <i>cow</i></b>, instead of <b>the
  # <i>cow</b></i>).
  #
  # For opening-tags.
  #
  def add_opening(position, text)
    check_position(position)
    @insert_positions << TextWeaver::InsertPosition.new(position, @set, text)
  end

  # Adds stuff to the weaver.
  #
  # See add_opening
  #
  # For closing-tags.
  #
  def add_closing(position, text)
    check_position(position)
    @insert_positions << TextWeaver::InsertPosition.new(position, @set * -1, text)
  end

  # Weaves in all stuff added via add_opening and add_closing.
  #
  # Returns the text with everything woven in.
  #
  # (self.text remains unmodified)
  #
  def weave
    weave_text = self.text.dup
    @insert_positions.sort!
    @insert_positions.reverse.each do |i_p|
      weave_text.insert(i_p.position, i_p.text)
    end
    return weave_text
  end

  protected

  # Resets the list of things to weave in.
  #
  def clear
    @insert_positions = []
    @set = 1
  end

  # Sanity-checks the positions
  #
  def check_position(position)
    if position > self.text.size
      raise TextWeaver::Error.new(position, @set), 'Position bigger than the weaver-text'
    elsif position < 0
      raise TextWeaver::Error.new(position, @set), 'Position is negative'
    end
  end
end
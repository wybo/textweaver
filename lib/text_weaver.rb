#--#
# Copyright: (c) 2006-2012 Wybo Wiersma <mail@wybowiersma.net>
#
# MIT Licensed
#++#
#
# TextWeaver allows one to insert tags in a running text.
#
# Openings are added before the given character-position, while
# closings are added after the given character-position.
#
# You should only add stuff to the weaver via add_opening and
# add_closing.

require 'text_weaver/version'
require 'text_weaver/error'
require 'text_weaver/insert_position'

class TextWeaver
  ### Attributes
  
  attr_accessor :text

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

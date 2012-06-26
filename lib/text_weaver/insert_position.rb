# BodyPositions allow one to point to a position in a Logi, and insert
# some text there.

class TextWeaver::InsertPosition
  include Comparable

  attr_accessor :position, :set, :text

  ### Constructors

  # Initializes a new InsertPosition.
  #
  def initialize(position, set, text)
    if position < 0
      raise TextWeaver::Error.new(position, set), 'Tried to create a negative InsertPosition'
    end

    self.position = position
    self.set = set
    self.text = text
  end

  ### Methods

  # Comparison

  # First the positions are compared.
  #
  #     1 > 4 => true
  #     2 > 3 => true
  #
  # If those are equal the sets are compared.
  #
  #     -2 < -1
  #
  # If the sets are also equal, an exception is thrown.
  #
  # Sets are used for keeping links apart from comments, etc...
  # Both links and comments etc. should be clustered and parsed from
  # templates as clusters.
  #
  def <=>(other)
    if self.position < other.position
      return -1
    elsif self.position > other.position
      return 1
    else
      if self.set < other.set
        return -1
      elsif self.set > other.set
        return 1
      else
        raise TextWeaver::Error.new(position, set), 'Overlap between same set of BodyPositions'
      end
    end
  end
end

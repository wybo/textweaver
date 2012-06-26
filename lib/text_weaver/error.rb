# This Error is raised if insert-positions err.

class TextWeaver::Error < StandardError
  attr_accessor :position, :set

  def initialize(position, set)
    @position = position
    @set = set
  end

  def message
    super.to_s + ': ' + @position.to_s + ', set: ' + @set.to_s
  end
end

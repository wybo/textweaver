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
#
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

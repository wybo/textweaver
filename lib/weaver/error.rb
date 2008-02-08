# Copyright: (c) 2008 The LogiLogi Foundation <foundation@logilogi.org>
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
#
# This Error is raised if insert-positions err.

class Weaver::Error < StandardError
  attr_accessor :position, :set
  
  def initialize(position, set)
    @position = position
    @set = set
  end

  def message
    super.to_s + ': ' + @position.to_s + ', set: ' + @set.to_s
  end
end

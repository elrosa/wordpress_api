module Wordpress

  module VERSION #:nodoc:
    MAJOR = 0
    MINOR = 1
    PATCH = 7
    PRE   = nil
    STRING = [MAJOR, MINOR, PATCH, PRE].compact.join('.')
  end

end

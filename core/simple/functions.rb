require 'transproc/all'

module Simple
  module Functions
    extend Transproc::Registry

    # import all singleton methods from a module/class
    import Transproc::HashTransformations
    import Transproc::ArrayTransformations

    def t(*args)
      Functions[*args]
    end
  end
end

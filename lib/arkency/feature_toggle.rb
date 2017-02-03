require "arkency/feature_toggle/version"

module Arkency
  class FeatureToggle
    def initialize
      @flags = Hash.new
    end

    def with(name, *args, &block)
      block.call if on?(name, *args)
    end

    def on?(name, *args)
      @flags.fetch(name, proc{|*_args| false }).call(*args)
    end

    def for(name, &block)
      @flags[name] = block
    end
  end
end

raise StandardError.new('FeatureToggle has been already defined, giving up.') if defined?(::FeatureToggle)
::FeatureToggle = Arkency::FeatureToggle

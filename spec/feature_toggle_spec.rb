require "spec_helper"
require "arkency/feature_toggle"

module Arkency
  RSpec.describe FeatureToggle do
    specify do
      toggle = FeatureToggle.new
      toggle.for('always_execute_feature') { true }
      expect { |b| toggle.with('always_execute_feature', &b) }.to yield_control
      expect(toggle.on?('always_execute_feature')).to eq(true)
    end

    specify do
      toggle = FeatureToggle.new
      toggle.for('never_execute_feature') { false }
      expect { |b| toggle.with('never_execute_feature', &b) }.to_not yield_control
      expect(toggle.on?('never_execute_feature')).to eq(false)
    end

    specify do
      toggle = FeatureToggle.new
      expect { |b| toggle.with('unknown_flag', &b) }.to_not yield_control
      expect(toggle.on?('unknown_flag')).to eq(false)
    end

    specify do
      toggle = FeatureToggle.new
      expect { |b| toggle.with('unknown_flag', :too, :many, args: true, &b) }.to_not yield_control
      expect(toggle.on?('unknown_flag', :too, :many, args: true)).to eq(false)
    end

    specify do
      yielded = []
      toggle  = FeatureToggle.new

      toggle.for('toggle_with_args') { |*args| yielded.concat(args) }
      toggle.with('toggle_with_args', 'user_id', 'user_role', some_key: 'some_value') { }

      expect(yielded).to eq(['user_id', 'user_role', {some_key: 'some_value'}])
    end

    specify do
      toggle = FeatureToggle.new
      toggle.for('even') { |number:| number.even? }
      expect { |b| toggle.with('even', number: 1, &b) }.to_not yield_control
      expect(toggle.on?('even', number: 1)).to eq(false)

      expect { |b| toggle.with('even', number: 2, &b) }.to yield_control
      expect(toggle.on?('even', number: 2)).to eq(true)
    end
  end
end

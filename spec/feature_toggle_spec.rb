require "spec_helper"

RSpec.describe FeatureToggle do
  it "has a version number" do
    expect(FeatureToggle::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end

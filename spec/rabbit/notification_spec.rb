require "spec_helper"

RSpec.describe FDE::Rabbit::Notification do
  it "has a version number" do
    expect(FDE::Rabbit::Notification::VERSION).not_to be nil
  end
end

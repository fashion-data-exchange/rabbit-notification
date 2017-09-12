require "spec_helper"

RSpec.describe FDE::Rabbit::Notification::Connection do
  subject { described_class.new }

  describe 'self.new' do
    it 'should return a Bunny::Session' do
      expect(described_class.new).to be_a(Bunny::Session)
    end

    it 'should have a host' do
      expect(subject.host).to_not be_nil
    end

    it 'should have a vhost' do
      expect(subject.vhost).to_not be_nil
    end
  end
end


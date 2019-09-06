require "spec_helper"

RSpec.describe FDE::Rabbit::Message do
  let(:payload) { { msg:'hello' }.to_json }
  let(:exchange_name) { 'fde.edi' }
  subject {
    described_class.new(payload, exchange_name)
  }

  let(:key_out) { 'fde.edi.out' }
  let(:key_in) { 'fde.edi.out' }

  let(:queue_out) { Bunny::Queue.new(subject.channel, 'fde.edi.out')}
  let(:queue_in) { Bunny::Queue.new(subject.channel, 'fde.edi.in')}

  before do
    subject.start
    queue_out.bind(subject.exchange, routing_key: 'fde.edi.out')
    queue_in.bind(subject.exchange, routing_key: 'fde.edi.in')
  end

  after do
    queue_out.delete
    queue_in.delete
    subject.close
  end

  describe 'methods' do
    describe '#deliver' do
      it 'should add a message to the exchange' do
        subject.deliver(key_out)
        sleep(1)
        expect(queue_out.message_count).to eq(1)
        expect(queue_in.message_count).to eq(0)
      end
    end

    describe '#connection' do
      it 'should return a Bunny::Session object' do
        expect(subject.connection).to be_a(Bunny::Session)
      end
    end

    describe '#exchange' do
      it 'should return a Bunny::Exchange object' do
        expect(subject.exchange).to be_a(Bunny::Exchange)
      end
    end

    describe '#channel' do
      it 'should return a Bunny::Channel' do
        expect(subject.channel).to be_a(Bunny::Channel)
      end
    end

  end
end

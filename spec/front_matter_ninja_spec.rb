require 'spec_helper'

require 'active_support'
require 'active_support/core_ext/string'

describe FrontMatterNinja do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  describe '.new' do
    subject { described_class.new doc }

    context 'given some front matter' do
      let(:doc) do
        %(
          ---
          one: 1
          two: 2
          ---

          Hello, world!
        ).strip_heredoc.strip
      end

      it 'returns a new FrontMatterNinja with parsed front matter' do
        expect(subject.data).to eq('one' => 1, 'two' => 2)
        expect(subject.content).to eq 'Hello, world!'
      end
    end

    context 'given some empty front matter' do
      let(:doc) do
        %(
          ---
          ---

          Hello, world!
        ).strip_heredoc.strip
      end

      it 'returns a new FrontMatterNinja with empty front matter' do
        expect(subject.data).to eq({})
        expect(subject.content).to eq 'Hello, world!'
      end
    end

    context 'given no front matter' do
      let(:doc) { 'Hello, world!' }

      it 'returns a new FrontMatterNinja with nil front matter' do
        expect(subject.data).to be_nil
        expect(subject.content).to eq 'Hello, world!'
      end
    end
  end
end

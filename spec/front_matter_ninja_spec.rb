require 'spec_helper'

require 'active_support'
require 'active_support/core_ext/string'

describe FrontMatterNinja do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  describe '.parse' do
    subject { described_class.parse doc }

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

      it 'returns a Hash of the front matter' do
        is_expected.to eq('one' => 1, 'two' => 2)
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

      it 'returns an empty Hash' do
        is_expected.to eq({})
      end
    end

    context 'given no front matter' do
      let(:doc) { 'Hello, world!' }

      it 'returns nil' do
        is_expected.to be_nil
      end
    end
  end
end

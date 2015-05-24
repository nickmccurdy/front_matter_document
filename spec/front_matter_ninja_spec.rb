require 'spec_helper'

require 'active_support'
require 'active_support/core_ext/string'

describe FrontMatterNinja do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  describe '.parse' do
    context 'given some front matter' do
      it 'returns a Hash of the front matter' do
        doc = %(
          ---
          one: 1
          two: 2
          ---

          Hello, world!
        ).strip_heredoc.strip

        expect(described_class.parse(doc)).to eq('one' => 1, 'two' => 2)
      end
    end

    context 'given some empty front matter' do
      it 'returns an empty Hash' do
        doc = %(
          ---
          ---

          Hello, world!
        ).strip_heredoc.strip

        expect(described_class.parse(doc)).to eq({})
      end
    end

    context 'given no front matter' do
      it 'returns nil' do
        expect(described_class.parse('Hello, world!')).to be_nil
      end
    end
  end
end

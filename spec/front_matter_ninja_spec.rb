require 'spec_helper'

require 'active_support'
require 'active_support/core_ext/string'

describe FrontMatterNinja do
  it 'has a version number' do
    expect(FrontMatterNinja::VERSION).not_to be nil
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

        expect(FrontMatterNinja.parse(doc)).to eq('one' => 1, 'two' => 2)
      end
    end

    context 'given some empty front matter' do
      it 'returns an empty Hash' do
        doc = %(
          ---
          ---

          Hello, world!
        ).strip_heredoc.strip

        expect(FrontMatterNinja.parse(doc)).to eq({})
      end
    end

    context 'given no front matter' do
      it 'returns an empty Hash' do
        expect(FrontMatterNinja.parse('Hello, world!')).to eq({})
      end
    end
  end
end

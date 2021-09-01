require_relative "spec_helper"
include Splitex

describe Scanner do

  describe '#glob' do
    it 'must left filenames as it is' do
      src = "lib/splitex.rb; lib/splitex/version.rb"
      _(Scanner.glob(src)).must_equal [
        "lib/splitex.rb", "lib/splitex/version.rb"]
    end

    it 'must expand patters to filenames' do
      src = "lib/splitex/*.rb"
      _(Scanner.glob(src).sort).must_equal [
        "lib/splitex/version.rb",
        "lib/splitex/builder.rb",
        "lib/splitex/scanner.rb",
        "lib/splitex/printer.rb",
        "lib/splitex/cli.rb"].sort
    end
  end

  describe '#scan' do
    it 'must scan sources line by line' do
      source = "lib/splitex/version.rb"
      words = []
      OStreamCatcher.catch do
        Scanner.scan(source) {|word| words << word}
      end
      _(words).must_equal %w(
        frozen string literal true module splitex version end
      )
    end

  end
end

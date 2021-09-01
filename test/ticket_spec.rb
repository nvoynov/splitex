require_relative "spec_helper"
include Splitex

describe CLI do

  describe '#words' do

    it 'must print words' do
      Dir.chdir("C:/Users/Nick/!English/Fiction/dimension-of-miracles") do
        OStreamCatcher.catch do
          CLI.start ["words", "ch1.txt", "skip/*.txt"]
          CLI.start %w(words ch1.txt skip/*.txt)
        end
      end
    end

  end

end

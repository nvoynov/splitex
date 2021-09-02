require_relative "spec_helper"
include Splitex

describe CLI do

  describe '#words' do

    it 'must print words' do
      source = LYRIC.split(?\n).first + ".txt"
      skip_source = File.join(Dir.pwd, "lib/skip-list.txt")
      Sandbox.() do
        File.write(source, LYRIC)
        _, out, _ = OStreamCatcher.catch do
          CLI.start ["words", source, skip_source]
        end
        _(out).must_match "Lemma\tTotal\tForms\n"
        _(out).must_match "twentieth\t10\ttwentieth:10\n"
      end
    end

  end

end

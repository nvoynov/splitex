require_relative "spec_helper"
include Splitex

describe Builder do

  describe '#call' do
    it 'must return array of [words, forms]' do
      source = ""
      skip_source = ""

      OStreamCatcher.catch do
        words, forms, _ = Builder.(source, skip_source)
        _(words).must_equal({})
        _(forms).must_equal({})
      end
    end

    it 'must build hash of words from source' do
      source = LYRIC.split(?\n).first + ".txt"
      skip_source = File.join(Dir.pwd, "lib/skip-list.txt")
      Sandbox.() do
        File.write(source, LYRIC)
        OStreamCatcher.catch do
          words, forms, _ = Builder.(source)
          _(words.size).must_equal 59
          _(forms.size).must_equal 59

          words, forms, skip = Builder.(source, skip_source)
          _(words.size).must_equal 45
          _(forms.size).must_equal 45
        end
      end
    end

  end

end

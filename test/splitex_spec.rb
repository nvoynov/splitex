# frozen_string_literal: true

require_relative "spec_helper"
include Splitex

describe Splitex do

  it 'must have version number' do
    _(::VERSION).wont_be_nil
  end

  describe 'flow' do
    it 'must scan-build-print' do
      lyricfile = LYRIC.split(?\n).first + ".txt"
      Sandbox.() do
        File.write(lyricfile, LYRIC)
        OStreamCatcher.catch do
          data = Builder.(lyricfile)
          Printer.(data)
          words, _, _ = data
          _(words.size).must_equal 59

          File.write("skip.txt", "she fox box get up on time her of date who")
          words, _, _ = Builder.(lyricfile, "skip.txt")
          _(words.size).must_equal 48
        end
      end
    end
  end

end

# encoding: UTF-8
# frozen_string_literal: true

require "lemmatizer"
require_relative "scanner"

module Splitex

  # The class gets words from scanner
  module Builder

    def self.call(source, skip_source = "")
      lmtzr = Lemmatizer.new

      skip = []
      Splitex::Scanner.scan(skip_source) do |w|
        l = lmtzr.lemma(w)
        skip << w
        skip << l unless w.eql?(l)
      end
      skip.uniq!
      skip.sort!

      words = {}
      forms = {}
      Splitex::Scanner.scan(source) do |w|
        lemma = lmtzr.lemma(w)
        next if skip.include?(lemma) || skip.include?(w)

        words[lemma] ||= 0
        words[lemma] +=  1

        forms[lemma] ||= {}
        forms[lemma][w] ||= 0
        forms[lemma][w] +=  1
      end

      [words, forms, skip]
    end
  end

end

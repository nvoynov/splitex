# encoding: UTF-8
# frozen_string_literal: true

require "lemmatizer"
require_relative "scanner"

module Splitex

  # The class prints words extracted by Builder
  module Printer

    def self.call(data)
      words, forms, _x = data
      puts "-= #{words.size} unique lemmas extracted"
      puts "Lemma\tTotal\tForms"
      # puts "-----\t-----\t-----"
      words
        .sort{|(k1,v1), (k2, v2)| v2 <=> v1}
        .each do |word, total|
          form = forms[word].map{|k, v| "#{k}:#{v}"}.join(", ")
          puts "#{word}\t#{total}\t#{form}"
        end
    end

  end
end

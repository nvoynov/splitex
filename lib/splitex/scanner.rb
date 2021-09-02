# encoding: UTF-8
# frozen_string_literal: true

module Splitex

  # The class scans words in files
  module Scanner

    def self.scan(source, &block)
      unless block_given?
        raise ArgumentError, "#block does not provided"
      end

      glob(source).each do |fn|
        puts "Processing '#{fn}' ..."
        File.foreach(fn) do |l|
          l.downcase!
          SUBSTITUTION.each{|k, v| l.gsub!(k, v)}
          l.gsub!(CONTRACTREXP, '')
          l.scan(SCANWORDREXP).each do |w|
            block.call(w) if w.length >= 2
          end
        end
      end
    end

    # FIXME: blabla- dash at the end of the word
    SCANWORDREXP = /[a-zA-Z]+\-?\'?[a-zA-Z]+/
    CONTRACTREXP = /(\'m|\'s|\'re|\'d|\'ve|\'ll|n\'t)/
    SUBSTITUTION = {
      /^can't/ => "can",
      /^won't/ => "will"
    }

    protected

    # @param source [String or Array<String>] where it might be a single filename, array of filenames, filename pattern, or array of filenames with file patterns
    # @return [Array<String>] filenames by patterns
    def self.glob(asource)
      source = asource
      return [] if source.is_a?(String) && source.empty?
      source = source.split(?\;).map{|i| i.rstrip.strip}
      # source  = [source] if source.is_a? String
      pattern = /[*?]|\.\./
      [].tap do |out|
        source.each do |fn|
          out << (fn.match(pattern) ? Dir.glob(fn) : fn)
        end
        out.flatten!
      end
    end
  end

end

# frozen_string_literal: true
require "thor"

module Splitex

  class CLI < Thor
    include Thor::Actions
    namespace :splitex

    no_commands {
      def exit_on_failure?
        true
      end
    }

    desc "version", "Show Worklog version"
    def version
      puts "Splitex v#{Splitex::VERSION}"
    end
    map %w[--version -v] => :version

    desc "words [FROM] [SKIP]", "Extract words FROM files [and skip words from SKIP]"
    def words(from = "*.*", skip = "")
      Printer.(Builder.(from, skip))
    end

    desc "smart [FROM] [SKIP]", "Extract words FROM files [and skip words from SKIP]"
    def smart(from = "*.*", skip = "")
      SmartPrinter.(Builder.(from, skip))
    end

  end

end

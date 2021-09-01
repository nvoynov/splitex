# frozen_string_literal: true

require_relative "lib/splitex/version"

Gem::Specification.new do |spec|
  spec.name          = "splitex"
  spec.version       = Splitex::VERSION
  spec.authors       = ["Nikolay Voynov"]
  spec.email         = ["nvoynov@gmail.com"]

  spec.summary       = "Breaking English texts into words, extracting lemmas, counting the number of occurrences of a single word in the text; lists of words to skip."
  spec.description   = "The Splitex gem was created to replenish the vocabulary of the English language through reading texts or listening to audio. It provides CLI for extracting words from texts, defining lemmas (which reduces the number of word forms to search and learn), counting the number of occurrences, and supporting word lists to skip."
  spec.homepage      = "https://github.com/nvoynov/splitex"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/nvoynov/splitex"
  spec.metadata["changelog_uri"] = "https://github.com/nvoynov/splitex"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "thor", "~> 1.0.1"
  spec.add_dependency "lemmatizer", "~> 0.2.2"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end

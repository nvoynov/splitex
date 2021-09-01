# Splitex

The `splitex` gem splits an input text into words. For each of those words it returns the following:

* the lemma of the word;
* the number of all occurrences of the lemma;
* the original word forms an number of occurrences.

```
Lemma   Total   Forms
winter      5   winters:3, winter:2
froze       3   frozen:2, freeze:1
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'splitex'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install splitex

## Usage

It provides a simple CLI that extract words from text files:

    splitex book.txt "skip-basic-words.txt; skip/*.txt"

My flow is the following

1. Get an English digital book and audio.
2. Convert the book to text (through pandoc) and split it by chapters
3. Get the words from first chapter `splitex ch1.txt > words-ch1.txt`
4. Copy "words-ch1.txt" to "skip" and "dict"
5. Search through dict/ch1.txt and remove all known words
6. Search words from dict/ch1.txt through dictionary, put its definitions and learn.
7. Read and listen the first chapter.
8. Prepare the second chapter by `splitex ch2.txt "skip-basic-words;skip/*.txt" > words-ch2.txt`. And there "words-ch2.txt" will contain only new words

Root folder for a book:
* book.txt
* skip
  * skip-basic.txt
  * skip-ch1.txt
  * skip-ch2.txt
* dict
  * dict-ch1.txt
  * dict-ch2.txt


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/splitex.

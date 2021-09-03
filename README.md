# Splitex

The `splitex` gem extracts words from an text input. For each of the extracted word it returns lemma of the word, all word forms encountered in the input, and number of occurrences of the lemma and all forms.

The typical output will be something like follows

```
Lemma   Total   Forms
winter      5   winters:3, winter:2
froze       3   frozen:2, freeze:1
...
```

I created this gem to replenish my English vocabulary through reading and listening. I use it when I'm reading books or listening to audio with the following workflow:

1. Take a text source and extract all words from the source into a separate file. Run the `splitex words FILENAME > skip.txt` command in your console. The `skip.txt` file will contain all the words extracted from `FILENAME` in natural order of its first occurrence in the text.
2. Looking through the `skip.txt` remove all unknown words and then run the `splitex words FILENAME skip.txt > words.txt`. The `words.txt` file will contain words from `FILENAME` by the exclusion the words listed in `skip.txt`.
3. Learn words from `words.txt`.
4. Skip `skip.txt` together with `words.txt` when you start to working with the next text source: `splitex words NEWSOURCE 'skip.txt;words.txt'`.

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

At the moment it provides only one single command `splitex words SOURCE [SKIP_SOURCE]` that is extracting all words from `SOURCE` skipping the words listed in `SKIP_SOURCE` and printing those right in your console tab-separated. For each of the extracted word it list lemma, total of lemmas, all word forms with total number of form occurrences.

The `SOURCE` and `SKIP_SOURCE` parameters might be filenames, list of filenames separated by ";", filename patterns with "?*", and/or mixed lists of filenames and patterns. All the following examples are correct

    splitex words some-file.txt
    splitex words some-file.txt skip.txt
    splitex words '*.md' 'skip.txt'
    splitex words '*.md' 'skip.txt;skip/*.*'

__When you want to use patterns__ `*?`, you should use `'<pattern>'` instead of just bare pattern without quotes or pattern in double quotes. There is an unexpected behavior of Thor library that always tries to expand `*` into separate arguments.

An average book usually consists of about 5000 - 6000 unique lemmas and 1-3 word forms per one lemma. There is no any sense to print all that stuff in console. But you are alway can use `>` operator like `splitex words book.txt > words.csv` and have tab-serparated result file.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/splitex.

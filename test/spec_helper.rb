# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "splitex"

require "minitest/autorun"

class Sandbox
  def self.call
    Dir.mktmpdir(['splitex']) {|dir|
      Dir.chdir(dir) {
        File.write("Twentieth Century Fox.txt", LYRIC)
        yield
      }
    }
  end
end

module OStreamCatcher

  def catch(&block)
    stdout_orig, stdout_mock = mock_stdout
    stderr_orig, stderr_mock = mock_stderr

    stderr_orig = $stderr
    stderr_mock = StringIO.new
    $stderr = stderr_mock

    begin
      result = block.call
    ensure
      $stdout = stdout_orig
      $stderr = stderr_orig
    end

    [result, stdout_mock.string, stderr_mock.string]
  end

    protected

      def mock_stdout
        orig = $stdout
        mock = StringIO.new
        $stdout = mock
        [orig, mock]
      end

      def mock_stderr
        orig = $stderr
        mock = StringIO.new
        $sterr = mock
        [orig, mock]
      end

  extend self

end

LYRIC = <<~EOF
  The Doors - Twentieth Century Fox

  [Verse 1]
  Well, she's fashionably lean
  And she's fashionably late
  She'll never wreck a scene
  She'll never break a date
  But she's no drag just watch the way she walks

  [Chorus]
  She's a twentieth century fox
  She's a twentieth century fox
  No tears, no fears
  No ruined years, no clocks
  She's a twentieth century fox, oh yeah

  [Verse 2]
  She's the queen of cool
  And she's the lady who waits
  Since her mind left school
  It never hesitates
  She won't waste time on elementary talk

  [Chorus]
  'Cause she's a twentieth century fox
  She's a twentieth century fox
  Got the world locked up
  Inside a plastic box
  She's a twentieth century fox, oh yeah
  Twentieth century fox, oh yeah
  Twentieth century fox, oh
  She's a twentieth century fox
EOF

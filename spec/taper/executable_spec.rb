# encoding: UTF-8

module Taper describe Executable do

  before do
    @movie = 'spec/fixtures/movie'
  end

  describe '.new' do

    before do
      $stderr = StringIO.new
    end

    after do
      $stderr = STDERR
    end

    def stderr
      $stderr.rewind
      $stderr.read
    end

    it 'requires a filename' do
      lambda { Executable.new [] }.should raise_error SystemExit
      stderr.should include 'no file given'
    end

    it 'requires that the file exists' do
      lambda { Executable.new ['bogus'] }.should raise_error SystemExit
      stderr.should include 'file does not exist'
    end

    it 'does not whine if the file exists' do
      Executable.new [@movie]
      stderr.should be_empty
    end

  end

  describe '#run' do

    it 'passes the file to the provider and prints the result on output' do
      provider = mock
      provider.should_receive(:subtitles_for).and_return '…subtitles…'
      Executable.new([@movie]).run output: output = StringIO.new, provider: provider
      output.rewind
      output.read.should == "…subtitles…\n"
    end

  end

end end

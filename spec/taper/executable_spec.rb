module Taper describe Executable do

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
      Executable.new ['spec/fixtures/movie']
      stderr.should be_empty
    end

  end

end end

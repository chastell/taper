# encoding: UTF-8

module Taper describe Providers::NapiProjekt do

  describe '.subtitles_for' do

    it '(temporarily) returns the right magic URL for inclusion in NapiProjekt requests' do
      {
        'Sintel.ogv'          => ['193b79bac996e3d5c25bcf87a056527d', 'http://napiprojekt.pl/unit_napisy/dl.php?l=PL&f=193b79bac996e3d5c25bcf87a056527d&t=a098b&v=other'],
        'Garden State.m4v'    => ['5f34093f90cf47c85f3bea70c500d09e', 'http://napiprojekt.pl/unit_napisy/dl.php?l=PL&f=5f34093f90cf47c85f3bea70c500d09e&t=e6680&v=other'],
        'Rien à déclarer.avi' => ['7ec948ba757d064bfb8f5bc5f30ccf8d', 'http://napiprojekt.pl/unit_napisy/dl.php?l=PL&f=7ec948ba757d064bfb8f5bc5f30ccf8d&t=0acc8&v=other'],
        'Love Actually.mkv'   => ['8b6307875f2b65df8c944dcc12c74610', 'http://napiprojekt.pl/unit_napisy/dl.php?l=PL&f=8b6307875f2b65df8c944dcc12c74610&t=a8a02&v=other'],
        'Vinci.avi'           => ['8ddc258cd1451017a54dafa8b977e89b', 'http://napiprojekt.pl/unit_napisy/dl.php?l=PL&f=8ddc258cd1451017a54dafa8b977e89b&t=aed47&v=other'],
        'Dr. Strangelove.avi' => ['974fbce02821e99135ed1f0c9a990b91', 'http://napiprojekt.pl/unit_napisy/dl.php?l=PL&f=974fbce02821e99135ed1f0c9a990b91&t=46546&v=other'],
        'Van Helsing.avi'     => ['c204f839efcd562ba8ca7311bc3eb0d4', 'http://napiprojekt.pl/unit_napisy/dl.php?l=PL&f=c204f839efcd562ba8ca7311bc3eb0d4&t=883c9&v=other'],
      }.each do |file, (md5, url)|
        Digest::MD5.should_receive(:digest).with(file).and_return md5
        Providers::NapiProjekt.subtitles_for(file).should == url
      end
    end

  end

end end

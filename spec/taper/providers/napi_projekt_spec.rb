module Taper describe Providers::NapiProjekt do

  describe '.magic' do

    it 'returns the right magic String for inclusion in NapiProjekt requests' do
      {
        '193b79bac996e3d5c25bcf87a056527d' => 'a098b',
        '5f34093f90cf47c85f3bea70c500d09e' => 'e6680',
        '7ec948ba757d064bfb8f5bc5f30ccf8d' => '0acc8',
        '8b6307875f2b65df8c944dcc12c74610' => 'a8a02',
        '8ddc258cd1451017a54dafa8b977e89b' => 'aed47',
        '974fbce02821e99135ed1f0c9a990b91' => '46546',
        'c204f839efcd562ba8ca7311bc3eb0d4' => '883c9',
      }.each do |hex, magic|
        Providers::NapiProjekt.magic(hex).should == magic
      end
    end

  end

end end

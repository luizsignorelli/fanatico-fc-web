#encoding: UTF-8

class Teams

  FEED_URL = 'http://globoesporte.globo.com/dynamo/semantica/editorias/plantao/futebol/times/%s/feed.rss'
  def self.all
    @@teams ||= { :americamg   => { :name => "América-MG"    , :feed => FEED_URL % "america-mg"},
                  :atleticogo  => { :name => "Atlético-GO"   , :feed => FEED_URL % "atletico-go"},
                  :atleticomg  => { :name => "Atlético-MG"   , :feed => FEED_URL % "atletico-mg"},
                  :atleticopr  => { :name => "Atlético-PR"   , :feed => FEED_URL % "atletico-pr"},
                  :avai        => { :name => "Avaí"          , :feed => FEED_URL % "avai"},
                  :bahia       => { :name => "Bahia"         , :feed => FEED_URL % "bahia"},
                  :botafogo    => { :name => "Botafogo"      , :feed => FEED_URL % "botafogo"},
                  :ceara       => { :name => "Ceará"         , :feed => FEED_URL % "ceara"},
                  :corinthians => { :name => "Corinthians"   , :feed => FEED_URL % "corinthians"},
                  :coritiba    => { :name => "Coritiba"      , :feed => FEED_URL % "coritiba"},
                  :cruzeiro    => { :name => "Cruzeiro"      , :feed => FEED_URL % "cruzeiro"},
                  :figueirense => { :name => "Figueirense"   , :feed => FEED_URL % "figueirense"},
                  :flamengo    => { :name => "Flamengo"      , :feed => FEED_URL % "flamengo"},
                  :fluminense  => { :name => "Fluminense"    , :feed => FEED_URL % "fluminense"},
                  :gremio      => { :name => "Gremio"        , :feed => FEED_URL % "gremio"},
                  :inter       => { :name => "Internacional" , :feed => FEED_URL % "internacional"},
                  :palmeiras   => { :name => "Palmeiras"     , :feed => FEED_URL % "palmeiras"},
                  :santos      => { :name => "Santos"        , :feed => FEED_URL % "santos"},
                  :saopaulo    => { :name => "São Paulo"     , :feed => FEED_URL % "sao-paulo"},
                  :vasco       => { :name => "Vasco"         , :feed => FEED_URL % "vasco"},
    }
  end
end
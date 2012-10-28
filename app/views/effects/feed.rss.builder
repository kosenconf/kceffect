xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "高専カンファレンスエフェクト - エフェクトの一覧"
    xml.description "高専カンファレンスから生まれた「エフェクト」を集めるサイトです。"
    xml.link root_url

    for effect in @effects
      xml.item do
        xml.title effect.comment
        xml.description  effect.user.name + " : " + effect.url
        xml.pubDate effect.created_at.to_s(:rfc822)
        xml.link effect_url(effect)
        xml.guid effect_url(effect)
      end
    end
  end
end

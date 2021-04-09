class Character < ActiveYaml::Base
  def self.random
    all.sample
  end

  def self.find_by_kana(kana)
    find_by(romaji: kana) || find_by(hiragana: kana) || find_by(katakana: kana)
  end
end

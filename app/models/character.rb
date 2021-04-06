class Character < ActiveYaml::Base
  def self.random
    all.sample
  end

  def self.find_by_hiragana_or_katakana(letter)
    find_by(hiragana: letter) || find_by(katakana: letter)
  end
end

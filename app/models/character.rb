class Character < ActiveYaml::Base
  def self.random
    all.sample
  end
end

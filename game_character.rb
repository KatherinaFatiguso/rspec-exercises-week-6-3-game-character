class GameCharacter
  attr_accessor :name, :level

  def initialize(name, level)
    @name = name
    @level = level
  end

  def boss?
    @level >= 10
  end

  def beats?(contender)
    @level > contender.level
  end

end

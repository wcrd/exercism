module BookKeeping
  VERSION = 1
end

module SpaceTimeRelations
  # earth orbital period in seconds:
  EARTH = 31557600
  # as fraction of earth years:
  MERCURY = 0.2408467 
  VENUS = 0.61519726
  MARS = 1.8808158 
  JUPITER = 11.862615 
  SATURN = 29.447498 
  URANUS = 84.016846 
  NEPTUNE = 164.79132 
end

class SpaceAge
  include SpaceTimeRelations

  def initialize(time)
    @time = time + 0.0
  end

  def on_earth
    @time/SpaceTimeRelations::EARTH
  end

  def on_mercury
    on_earth/SpaceTimeRelations::MERCURY
  end

  def on_venus
    on_earth/SpaceTimeRelations::VENUS
  end

  def on_mars
    on_earth/SpaceTimeRelations::MARS
  end

  def on_jupiter
    on_earth/SpaceTimeRelations::JUPITER
  end

  def on_saturn
    on_earth/SpaceTimeRelations::SATURN
  end

  def on_uranus
    on_earth/SpaceTimeRelations::URANUS
  end

  def on_neptune
    on_earth/SpaceTimeRelations::NEPTUNE
  end

end


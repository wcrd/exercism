# Clock class stores the time in hh:mm 12h format
class Clock
  attr_reader :total_minutes

  def initialize(hour: 0, minute: 0)
    @total_minutes = parse_time(hour, minute)
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end

  def ==(other)
    self.to_s == other.to_s
  end

  def +(other)
    Clock.new(minute: @total_minutes + other.total_minutes)
  end

  def -(other)
    Clock.new(minute: @total_minutes - other.total_minutes)
  end

  private

  def parse_time(hours, minutes)
    time_in_minutes = hours * 60 + minutes
    # normalise to 24hrs (1440 minutes)
    time_in_minutes % 1440
  end

  def hour
    @total_minutes / 60
  end

  def minute
    @total_minutes % 60
  end
end

# Clock class stores the time in hh:mm 12h format
class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    time_in_minutes = parse_time(hour, minute)
    @hour, @minute = time_in_minutes.divmod(60)
  end

  def to_s
    "#{format('%02d', @hour)}:#{format('%02d', @minute)}"
  end

  def ==(other)
    self.to_s == other.to_s
  end

  def +(other)
    Clock.new(hour: @hour + other.hour, minute: @minute + other.minute)
  end

  def -(other)
    Clock.new(hour: @hour - other.hour, minute: @minute - other.minute)
  end

  private

  def parse_time(hours, minutes)
    time_in_minutes = hours * 60 + minutes
    # normalise to 24hrs (1440 minutes)
    time_in_minutes % 1440
  end
end

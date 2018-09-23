# Clock class stores the time in hh:mm 12h format
class Clock
  attr_reader :hour, :minute

  def initialize(args)
    time_in_minutes = time_parser(args[:hour], args[:minute])
    @hour, @minute = time_in_minutes.divmod(60)
  end

  def to_s
    "#{format('%02d', @hour)}:#{format('%02d', @minute)}"
  end

  def ==(other)
    self.to_s == other.to_s
  end

  def +(other)
    @hour, @minute = time_parser(@hour + other.hour, @minute + other.minute).divmod(60)
    self
  end
  
  def -(other)
    @hour, @minute = time_parser(@hour - other.hour, @minute - other.minute).divmod(60)
    self
  end

  private

  def time_parser(hours, minutes)
    time_in_minutes = hours.to_i * 60 + minutes.to_i
    # normalise to 24hrs (1440 minutes)
    time_in_minutes % 1440
  end
end

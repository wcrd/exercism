class Clock
  attr_reader :hour, :minute

  def initialize(args)
    div, @minute = minute_parser(args[:minute])
    @hour = hour_parser(args[:hour], div)
  end

  def to_s
    time = "#{format('%02d', @hour)}:#{format('%02d', @minute)}"
  end

  def ==(other)
    self.to_s == other.to_s
  end

  def +(other)
    div, @minute = minute_parser(@minute+other.minute)
    @hour = hour_parser(@hour+other.hour+div)
    self
  end
  
  def -(other)
    div, @minute = minute_parser(@minute-other.minute)
    @hour = hour_parser(@hour-other.hour+div)
    self
  end


  private

  def minute_parser(minutes)
    return minutes.divmod(60) unless minutes.nil?
    return 0,0
  end

  def hour_parser(hours, add_hrs=0)
    hours.nil? ? add_hrs%24 : (hours+add_hrs)%24
  end

end

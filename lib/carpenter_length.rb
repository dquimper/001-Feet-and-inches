class CarpenterLength
  def initialize(length)
    @length = length
  end

  def inches
    (@length % 12).floor
  end

  def feet
    (@length / 12).floor
  end

  def decimal
    @length - @length.floor
  end

  def fraction
    if decimal == 0
      return nil
    else
      num = (decimal * 32).to_i
      denum = 32
    end
    while (num / 2.0) == (num / 2)
      num /= 2
      denum /= 2
    end
    return "#{num}/#{denum}"
  end

  def to_s
    arr = []
    arr << footify
    arr << inchify

    str = arr.compact.join(", ").strip

    str = "0 inches" if str == ""
    return str
  end

  private
  def footify
    if feet == 0
      nil
    elsif feet > 1
      "#{feet} feet"
    else
      "1 foot"
    end
  end

  def inchify
    arr = []

    if inches == 0
      arr << nil
    else
      arr << inches
    end

    if fraction
      arr << fraction
    end

    str = arr.compact.join(" and ")
    if str == ""
      return nil
    else
      if inches > 1 or fraction
        "#{str} inches"
      else
        "1 inch"
      end
    end
  end
end
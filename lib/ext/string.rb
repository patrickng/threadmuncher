class String
  def to_b
    return true if self == true || self =~ (/(true|t|yes|y|1)$/i)
    return false if self == false || self =~ (/(false|f|no|n|0)$/i)
    raise ArgumentError.new("Invalid value for Boolean: \"#{self}\"")
  end
end
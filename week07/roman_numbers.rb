module Roman
  def self.const_missing(name)
    1 if name == :I
    5 if name == :V
    10 if name == :X
  end
end

puts Roman::V

class Object
  def blank?
    if self == nil or self == false
      true
    elsif self.class == String
      self.chars.reject { |ch| ch == " " or ch == "\n" or ch == "\t" }.empty?
    elsif self.respond_to?(:empty?)
      self.empty?
    end
  end

  def present?
    ! blank?
  end

  def presence
    if present?
      self
    else
      nil
    end
  end

  def try(method)
    self.send(method) if self
  end
end

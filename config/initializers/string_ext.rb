class String
  def string_or_nil
    return nil unless present?
    self
  end
end
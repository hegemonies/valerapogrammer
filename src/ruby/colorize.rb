# frozen_string_literal: true

# Colorize text
class Colorize
  def self.do(color_code, text)
    "\e[#{color_code}m#{text}\e[0m"
  end
end

# frozen_string_literal: true

# Colorize text
class Colorize
  def do(color_code, text)
    return "\e[#{color_code}m#{text}\e[0m"
  end
end

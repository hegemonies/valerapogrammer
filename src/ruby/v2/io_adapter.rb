# frozen_string_literal: true

class IOAdapter
  def self.write(str)
    puts str
  end

  def self.read
    gets
  end
end

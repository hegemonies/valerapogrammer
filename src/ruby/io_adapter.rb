# frozen_string_literal: true

class IOAdapter

  def self.write(str)
    print str
  end

  def self.writeln(str)
    puts str
  end

  def self.read
    gets.chomp
  end
end

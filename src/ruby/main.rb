# frozen_string_literal: true

require './application'

begin
  Application.new.run
# rescue Exception => e
#   IOAdapter.writeln e.backtrace
#   IOAdapter.writeln e.message
#   IOAdapter.writeln "\n By-by"
end


# begin
#   field = 'mana'
#   operation = '-'
#   value = '5'
#   puts eval("#{field}#{operation}#{value}")
# end
#
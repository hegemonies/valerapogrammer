# frozen_string_literal: true

require './io_adapter'
require './colorize'
require './colors_enum'
require './item'

class Menu
  def initialize(app_context)
    @app_context = app_context
  end

  def items
    @items ||= @app_context
     .available_actions
     .map { |action| Item.new(action: action, title: action.before_text) }
     .concat([
       Item.new(action: :Save, title: 'Save'),
       Item.new(action: :Load, title: 'Load')
     ])
  end

  def render
    render_valera_stats
    items.each_with_index do |item, index|
      IOAdapter.write "[#{index}] #{item.title}"
    end
  end

  def render_valera_stats
    IOAdapter.write(Colorize.do(Colors::CYAN, 'Valera:') +
     Colorize.do(Colors::RED, " health #{@app_context.valera.health}") +
     Colorize.do(Colors::BLUE, " mana #{@app_context.valera.mana}") +
     Colorize.do(Colors::YELLOW, " cheerfulness #{@app_context.valera.cheerfulness}") +
     Colorize.do(Colors::MAGENTA, " fatigue #{@app_context.valera.fatigue}") +
     Colorize.do(Colors::GREEN, " money #{@app_context.valera.money}\n"))
  end
end

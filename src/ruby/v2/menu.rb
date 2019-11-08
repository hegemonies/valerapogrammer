# frozen_string_literal: true

class Menu
  def initialize(app_context)
    @app_context = app_context
  end

  def items
    @items ||= app_context
     .available_actions
     .map { |action| Item.new(action: action, title: action.before_text) }
     .concat([
       Item.new(action: :Save, title: 'Save'),
       Item.new(action: :Load, title: 'Load')
     ])
  end

  def render
    items.each_with_index do |item, index|
      IOAdapter.write "[#{index}] #{item.title}"
    end
  end
end

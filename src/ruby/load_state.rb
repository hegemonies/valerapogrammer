# frozen_string_literal: true

require './app_states'

class LoadState < AppStates.Base

  def render
    IOAdapter.write 'Load Valera stats from: '
  end

  def next
    settings_filename = IOAdapter.read
    return RenderError.new(AppContext.new(
        valera: @app_context.valera,
        actions_container: @app_context.actions_container,
        prev_data: "Error: file - #{settings_filename}, does not exist."
    )) unless File.exist? settings_filename
    build_next_step YAML.load(File.read(settings_filename))
  end

  private

  def build_next_step(settings)
    return RenderError.new(AppContext.new(
        valera: @app_context.valera,
        actions_container: @app_context.actions_container,
        prev_data: "Error load settings with health value #{settings.health}"
    )) if CheckValeraStats.check_health settings.health

    return RenderError.new(AppContext.new(
        valera: @app_context.valera,
        actions_container: @app_context.actions_container,
        prev_data: "Error load settings with mana value #{settings.mana}"
    )) if CheckValeraStats.check_health settings.mana

    return RenderError.new(AppContext.new(
        valera: @app_context.valera,
        actions_container: @app_context.actions_container,
        prev_data: "Error load settings with cheerfulness value #{settings.cheerfulness}"
    )) if CheckValeraStats.check_health settings.cheerfulness

    return RenderError.new(AppContext.new(
        valera: @app_context.valera,
        actions_container: @app_context.actions_container,
        prev_data: "Error load settings with fatigue value #{settings.fatigue}"
    )) if CheckValeraStats.check_health settings.fatigue

    RenderError.new(AppContext.new(
        valera: @app_context.valera,
        actions_container: @app_context.actions_container,
        prev_data: "Error load settings with money value #{settings.money}"
    )) if CheckValeraStats.check_health settings.money
  end

end

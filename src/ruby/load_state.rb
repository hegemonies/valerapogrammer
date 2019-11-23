# frozen_string_literal: true

require './app_states'
require './check_valera_stats'
require './valera'

module AppStates
  class LoadState < Base
    def render
      IOAdapter.write 'Load Valera stats from: '
    end

    def next
      settings_filename = "./resources/#{IOAdapter.read}"
      unless File.exist? settings_filename
        return RenderError.new(AppContext.new(
                                 valera: @app_context.valera,
                                 actions_container: @app_context.actions_container,
                                 prev_data: "Error: file - #{settings_filename}, does not exist."
                               ))
      end
      build_next_step YAML.load(File.read(settings_filename))
    end

    private

    def build_next_step(settings)
      unless CheckValeraStats.check_health settings.health
        return RenderError.new(AppContext.new(
                                 valera: @app_context.valera,
                                 actions_container: @app_context.actions_container,
                                 prev_data: "Error load settings with health value #{settings.health}"
                               ))
      end

      unless CheckValeraStats.check_health settings.mana
        return RenderError.new(AppContext.new(
                                 valera: @app_context.valera,
                                 actions_container: @app_context.actions_container,
                                 prev_data: "Error load settings with mana value #{settings.mana}"
                               ))
      end

      unless CheckValeraStats.check_health settings.cheerfulness
        return RenderError.new(AppContext.new(
                                 valera: @app_context.valera,
                                 actions_container: @app_context.actions_container,
                                 prev_data: "Error load settings with cheerfulness value #{settings.cheerfulness}"
                               ))
      end

      unless CheckValeraStats.check_health settings.fatigue
        return RenderError.new(AppContext.new(
                                 valera: @app_context.valera,
                                 actions_container: @app_context.actions_container,
                                 prev_data: "Error load settings with fatigue value #{settings.fatigue}"
                               ))
      end

      unless CheckValeraStats.check_health settings.money
        RenderError.new(AppContext.new(
                          valera: @app_context.valera,
                          actions_container: @app_context.actions_container,
                          prev_data: "Error load settings with money value #{settings.money}"
                        ))
      end

      new_valera = Valera.new(health: settings.health,
                              mana: settings.mana,
                              cheerfulness: settings.cheerfulness,
                              money: settings.money,
                              fatigue: settings.fatigue)
      InputAction.new(AppContext.new(
                        valera: new_valera,
                        actions_container: @app_context.actions_container,
                        prev_data: nil
                      ))
    end
  end
end

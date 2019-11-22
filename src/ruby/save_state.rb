# frozen_string_literal: true

module AppStates
  class SaveState < Base

    def render
      IOAdapter.write 'Save Valera stats to file: '
    end

    def next
      settings_filename = IOAdapter.read
      return RenderError.new(AppContext.new(
          valera: @app_context.valera,
          actions_container: @app_context.actions_container,
          prev_data: "Error: file - #{settings_filename}, does not exist."
      )) unless File.exist? settings_filename
      File.open(settings_filename, "w") { |file| file.write(valera.to_yaml) }
      build_next_state
    end

    private

    def build_next_state
      InputAction.new(@app_context)
    end

  end
end

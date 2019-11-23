# frozen_string_literal: true

module AppStates
  class SaveState < Base
    def render
      IOAdapter.write 'Save Valera stats to file: '
    end

    def next
      settings_filename = IOAdapter.read
      unless settings_filename.to_s.empty?
        File.open("./resources/#{settings_filename}", 'w') { |file| file.write(@app_context.valera.to_yaml) }
      end
      build_next_state
    end

    private

    def build_next_state
      InputAction.new(@app_context)
    end
  end
end

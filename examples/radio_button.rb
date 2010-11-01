require_relative 'helpers/example_window'

class ExampleState < GuiState
  def setup
    pack :vertical do
      my_label = label text: "No button selected"

      button text: "Deselect" do
        subscribe :clicked_left_mouse_button do |sender, x, y|
          @group.value = nil
        end
      end

      button text: "Select #7" do
        subscribe :clicked_left_mouse_button do |sender, x, y|
          @group.value = 7
        end
      end

      @group = group padding_y: 10 do
        pack :grid, num_columns: 5, padding: 0, spacing: 4 do
          15.times do |i|
            radio_button i, text: "##{i}", width: 60
          end
        end

        subscribe :changed do |sender, value|
          my_label.text = if value
            "Button #{value.to_s} selected"
          else
            "No button selected"
          end
        end
      end
    end
  end
end

ExampleWindow.new.show
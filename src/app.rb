require_relative "view/ruby2d"
require_relative "model/state"

class App
    def star
        view = View::Ruby2dView.new 
        initial_state = Model::initial_state
        view.render(initial_state)
    end

    def init_timer
        loop do
            sleep 0.5
        end
    end
end
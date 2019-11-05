module Actions
    def self.move_snake(snake)
        next_direction = state.next_direction
        next_position = calc_next_position(state)
        # verificar si la siguiente casilla es valida
        if position_is_valid?(state, next_position)
            move_snake_to(state, next_position)
        else
            end_game(state)
        end
    end

    private

    def calc_next_position(state)
        current_position = state.snake.positions.first
        case state.next_direction
        when UP
            # decrementar fila
            return Model::Coord.new(new_position.row - 1, new_position.col)
        when DOWN
            # incrementar fila
            return Model::Coord.new(new_position.row + 1, new_position.col)
        when RIGHT
            # incrementar col
            return Model::Coord.new(new_position.row , new_position.col + 1)
        when LEFT
            # decrementar col
            return Model::Coord.new(new_position.row, new_position.col - 1)

        end
    end

    
    def position_is_valid?(state, position)
        is_invalid = ((position.row >= state.grid.rows || position.row < 0) ||
            (position.col >= state.grid.cols || position.col < 0))
        
       return false if is_invalid
       return !(state.snake.positions.include? position)      
    end

    def move_snake_to(state, next_position)
        new_position = [next_position] + state.snake.positions[0...-1]
        state.snake.positions = new_position
        state
    end

    def end_game(state)
        state.game_finished = true
        state
    end
end
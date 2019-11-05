# Representacion del estado del juego
module Model
    
    module Direction
        UP = :up
        DOWN = :down
        LEFT = :left
        RIGHT = :right
    end

    class Coord < Struct.new(:row , :col)
    
    end

    # Herencia, comida pertenece a coordenada
    class Food < Coord 
    
    end
    
    class Snake < Struct.new(:positions)
    
    end

    class Grid < Struct.new(:rows, :cols)
    
    end

    class State < Struct.new(:snake, :food, :grid, :next_direction, :game_finished)
    
    end

    def self.initial_state # Estado inicial
        Model::State.new(
            Model::Snake.new([Model::Coord.new(1,1), Model::Coord.new(0,1)]), #posicion de la cabeza y cola de la Snake
            Model::Food.new(4,4), # posicion de Comida de la Snake
            Model::Grid.new(8, 12) # cuantas filas y columnas,
            Direction::DOWN,
            false
        )
    end
end
module View

    class Ruby2dView
    
        def initialize

        end

        def render(state)
            extend Ruby2D::DSL
            set(title: "Snake", width: 600, height: 400s)
            show
        end
    end

end
class KittenFinder::Grid
  def initialize
    @direction = North
    @x = @y = 0
  end

  def follow_relative_directions(directions)
    directions.each { |d| follow_relative_direction d }
    location
  end

  def follow_relative_direction(direction)
    case direction
      when 'forward' then @x, @y = @direction.move_forward_at(@x, @y)
      when 'right' then @direction = @direction.turn_right
      when 'left' then @direction = @direction.turn_left
      else raise "Unrecognized relative direction #{direction}"
    end
  end

  def location
    [@x, @y]
  end

  private

  class CardinalDirection
    %i[move_forward_at turn_right turn_left].each do |m|
      define_singleton_method(m) { raise NotImplementedError }
    end
  end

  class North < CardinalDirection
    class << self
      def move_forward_at(x, y)
        [x, y += 1]
      end

      def turn_right
        East
      end

      def turn_left
        West
      end
    end
  end

  class East < CardinalDirection
    class << self
      def move_forward_at(x, y)
        [x += 1, y]
      end

      def turn_right
        South
      end

      def turn_left
        North
      end
    end
  end

  class South < CardinalDirection
    class << self
      def move_forward_at(x, y)
        [x, y -= 1]
      end

      def turn_right
        West
      end

      def turn_left
        East
      end
    end
  end

  class West < CardinalDirection
    class << self
      def move_forward_at(x, y)
        [x -= 1, y]
      end

      def turn_right
        North
      end

      def turn_left
        South
      end
    end
  end
end

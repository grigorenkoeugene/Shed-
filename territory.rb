class Shed 
    attr_reader :x, :y, :width, :length
    def initialize(x, y, width, length)
        @x = x
        @y = y
        @width = width
        @length = length
    end
end

class Territory
  attr_reader :sheds

  def initialize(width, length)
      @sheds = []
      @width = width
      @length = length
  end

def add_shed(shed)

  shed_with_width_x = shed.x + shed.width
  shed_with_length_y = shed.y + shed.length

  if shed.width > @width || shed.length > @length
    puts "Сарай вылазит за территорию"
    return
  end

  if  shed_with_width_x > @width || shed_with_length_y > @length
    puts "Сарай вылазит за территорию"
    return
  end
  
  @sheds.each do |arrayShads|
    if arrayShads.length + arrayShads.y >= shed_with_length_y || arrayShads.width + arrayShads.x >= shed_with_width_x
      puts "Срай #{shed.inspect} уже есть в этом месте" 
    return
  end
end

        @sheds << shed
    end
end

puts "Введите размеры территории"

territory = Territory.new(gets.to_i, gets.to_i)

for i in 1..3 do
    puts "Введите размеры сарая x, y, width, length: "
    shed1 = Shed.new(gets.to_i, gets.to_i, gets.to_i, gets.to_i)
    territory.add_shed(shed1)
end

puts "Количество сараев на территории: #{territory.sheds.count}"
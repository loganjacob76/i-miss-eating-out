class Restaurant
  attr_reader :opening_time,
              :name,
              :dishes

  def initialize(opening_time, name)
    @opening_time = opening_time
    @name = name
    @dishes = []
  end

  def closing_time(hours)
    "#{@opening_time.to_i + hours}:00"
  end

  def add_dish(dish)
    @dishes << dish
  end

  def open_for_lunch?
    @opening_time.to_i <= 12
  end

  def menu_dish_names
    @dishes.each do |dish|
      dish.upcase!
    end
  end

  def announce_closing_time(hours)
    time_format = (if @opening_time.to_i + hours >= 12
      (@opening_time.to_i + hours) - 12
    else
      @opening_time.to_i + hours
    end)


    am_or_pm = (if @opening_time.to_i + hours >= 12
      "PM"
    else
      "AM"
    end)

    "#{@name} will be closing at #{time_format}:00#{am_or_pm}"
  end

end

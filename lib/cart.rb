require_relative 'menu'

class Cart

  attr_reader :selected_dishes

  def initialize(menu = Menu.new)
    @selected_dishes = []
    @menu = menu
  end

  def select_dish(new_dish)
    @menu.list_of_dishes.each do |choosen_dish|
      @selected_dishes << choosen_dish if choosen_dish[:dish] == new_dish
    end
  end

  def your_selection
    add = 0
    count_dish = []
    @selected_dishes.each do |s|
      n = @selected_dishes.count(s)
      if !count_dish.include?(s)
        puts "#{n} #{s[:dish]}: £#{s[:price]}, total £#{add += s[:price].to_f * n}0"
      end
      count_dish << s
    end
  end

  def give_total
    add = 0
    @selected_dishes.each do |selection|
      add += selection[:price].to_f
    end
    "£#{add.to_s}0"
  end

  def see_the_menu
    @menu.see_menu
  end
end

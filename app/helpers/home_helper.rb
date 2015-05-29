module HomeHelper

  def get_class_position(index)
    @length = Service.all.to_a.length
    if index % 3 == 0 && ((@length - 1)..@length).include?(index) == false
      'left'
    elsif (index % 3 == 1 && @length - 1 != index) || (@length % 3 == 1 && @length - 1 == index)
      'center'
    elsif index % 3 == 2 || (@length % 3 == 2 && ((@length - 1)..@length).include?(index))
      'right'
    end
  end
end

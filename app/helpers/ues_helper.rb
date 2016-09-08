module UesHelper

  def convert_string_to_nums(array)
    res = Array.new
    if not array.nil? and array.kind_of?(Array) and not array.empty?
      array.first.split(/,/).each do |number|
        res.push(number.to_i)
      end
     end
    res
  end

  def get_min_max_slider(min_ects, max_ects, array_filters)
    res = Array.new
    if not array_filters.nil? and array_filters.kind_of?(Array) and not array_filters.blank?
      if array_filters[0] < min_ects
        res.push(min_ects)
      else
        res.push(array_filters[0])
      end
      if array_filters[1] > max_ects
        res.push(max_ects)
      else
        res.push(array_filters[1])
      end
    end

    res
  end

end

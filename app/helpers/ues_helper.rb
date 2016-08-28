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
=begin
  def get_min_max_slider(collection, attribute, array_form, min, max)
    res = Array.new
    res.push(0)
      res.push(100)
      if collection.column_names.include? attribute.to_s
        res.push(200)

        if not array_form.nil? and array_form.kind_of?(Array) and not array_form.blank?
          res.push(300)
          if array_form.first > min
            res.push(array_form.first)
          else
            res.push(min)
          end
          if array_form[1] < max
            res.push(array_form[1])
          else
            res.push(max)
          end
        else
          res.push(min)
          res.push(max)
        end
      end

    res
  end
=end

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

# To change this template, choose Tools | Templates
# and open the template in the editor.

module Shared

  F4 = "\\115"
  PROVIDER1 = "provider_1"
  PROVIDER2 = "provider_2"

  def select_preparation

    case @kte.provider

    when PROVIDER1
      kw = "#{get("@kw")} KW"
      type_keys("preparations", get("@set_up"))
      sleep @sleep*2
      @last_element, @last_value = "//span/ul/li", "#{kw}"
      unless is_present?(@last_element)
        get("@set_up").size.times { |i| page.key_press("preparations","\\8" ) }
        type_keys("preparations", @last_value)
      end
      click_button_item "//span/ul/li"

    when PROVIDER2
      cv_kw = "#{get("@cv")} CV - #{get("@kw")} KW"
      type_keys("preparations", get("@set_up"))
      sleep @sleep*2
      @last_element, @last_value = "//span/ul/li", "#{cv_kw}"
      unless is_present?(@last_element)
        get("@set_up").size.times { |i| page.key_press("preparations","\\8" ) }
        type_keys("preparations", @last_value)
        sleep @sleep
      end
      click_button_item "//span/ul/li"

    else
      nil
    end

  end

  def select_model_set_up(id, value)
    @last_element, @last_value = id, (value =~ /index=/i)? value : value.split("|")[0]
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's selected option element: [#{@last_element}] with label value: [#{@last_value}]"}

    begin
      page_select(@last_element, "label=#{@last_value}")
    rescue Exception => ex
      case value.split("|").size
        when 1
          raise ex
        else
          @last_value = "label=#{value.split("|")[1]}"
          page_select @last_element, "#{@last_value}"
          @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => First Model or Set-up not matched for profile [#{@kte.profile}] and record [#{@record}]! Using secondary regex value with selected label #{page.get_selected_label(@last_element)}"}
      end
    end
  end

  def type_model_set_up(id, value, item)

    case @kte.provider

    when PROVIDER1
      @last_element, @last_value = id, value
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's typed input element: [#{@last_element}] with value: [#{@last_value}]"}

      page.type(@last_element, " ")
      sleep @sleep
      page.key_press(@last_element, "\\8")
      page.key_up(@last_element, F4)

      select_fake_option(@last_element, load_text_element_array(item)[1], item)

    when PROVIDER2
      select_fake_option(id, value, item)
    else
      nil
    end

  end

  def select_max(id, value)
    @last_element, @last_value = id, (value =~ /index=/i)? value : "label=#{value}"
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's selected option element: [#{@last_element}] with label value: [#{@last_value}]"}

    begin
      page_select(@last_element, "label=#{@last_value}")
      assert_equal page.get_selected_label(@last_element), value unless value =~ /regexpi/i unless value =~ /index=/i
    rescue Exception => ex
      loc_array  = []
      loc_array = page.get_select_options(@last_element)
      page_select @last_element, "index=#{loc_array.size - 1}"
      @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => Indemnity limit not matched for profile [#{@kte.profile}] and record [#{@record}]! Using max available value with selected label #{page.get_selected_label(@last_element)}"}
    end
  end

  def store_parameter(parameter, value)

    case parameter
      when :make
        @kte.car_make = value
      when :model
        @kte.car_model = value
      when :preparation
        @kte.car_preparation = value
      when :job
        @kte.job = value
      else
    end
  end

  def load_text_element_array(e)

    preparation_arr, i = [], 1
    item = "#{e}[#{i}]"
    while is_present?(item) == true
      preparation_arr << page.get_text(item)
#      puts page.get_text(item)
      i += 1
      item = "#{e}[#{i}]"
    end
    return preparation_arr

  end

end

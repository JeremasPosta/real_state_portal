class PropertiesController < ApplicationController
  def index
    request = EasyBrokerApi.get_properties(properties_params)
    response = request.execute
    @actual_page = params[:page].to_i
    @last_page = max_page_number
    @properties_list = JSON.parse(response.body)['content']
  end

  def max_page_number
    max_page_items = EasyBrokerApi::MAX_ITEMS
    total_items = pagination['total'].to_i

    return total_items / max_page_items if (total_items % max_page_items).zero?

    (total_items / max_page_items + 1).floor
  end

  private

  def properties_params
    validate_page_number.permit(:page)
  end

  def validate_page_number
    params[:page] = 1 if params[:page].to_i < 1

    if params[:page].to_i > max_page_number
      params[:page] = max_page_number
      return params
    end

    params
  end

  def pagination
    JSON.parse(EasyBrokerApi.get_properties.execute.body)['pagination']
  end
end

class PropertiesController < ApplicationController
  def index
    request = EasyBrokerApi.get_properties(properties_params)
    response = request.execute
    @actual_page = params[:page].to_i
    @last_page = max_page_number
    @properties_list = JSON.parse(response.body)['content']
  end

  def show
    request = EasyBrokerApi.get_property(params[:id])
    response = request.execute
    @from_page_number = params[:from_page].to_i
    @property = JSON.parse(response.body)
  end

  def contact
    contact_data = {
      name: params[:name],
      phone: params[:phone],
      email: params[:email],
      property_id: params[:id],
      message: params[:message],
      source: "mydomain.com"
    }

    if EasyBrokerApi.post_contact(contact_data).execute
      redirect_back fallback_location: root_path, notice: 'Thanks!'
    else
      redirect_back fallback_location: root_path, alert: 'Oh no!'
    end
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

class PropertiesController < ApplicationController
  def index
    response = EasyBrokerApi.get_properties(properties_params)
    @actual_page = params[:page].to_i
    @last_page = max_page_number
    @properties_list = JSON.parse(response.body)['content']
  end

  def show
    response = EasyBrokerApi.get_property(params[:id])
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

    if EasyBrokerApi.post_contact(contact_data)
      redirect_back fallback_location: root_path, notice: 'Thanks!'
    else
      redirect_back fallback_location: root_path, alert: 'Oh no!'
    end
  end

  def max_page_number
    max_page_items = EasyBrokerApi::MAX_ITEMS.to_f
    total_items = pagination['total'].to_f

    (total_items / max_page_items).ceil
  end

  private

  def properties_params
    validate_page_number.permit(:page)
  end

  def validate_page_number
    max_page = max_page_number

    params[:page] = 1         if params[:page].to_i < 1
    params[:page] = max_page  if params[:page].to_i > max_page

    params
  end

  def pagination
    JSON.parse(EasyBrokerApi.get_properties.body)['pagination']
  end
end

module RestImlApi
  class CreateOrder
    # http://api.iml.ru/Help/v4/CreateOrder

    AVAILABLE_PARAMS = {
      test: 'Test',
      job: 'Job',
      customer_order_no: 'CustomerOrder',
      delivery_date: 'DeliveryDate',
      volume: 'Volume',
      weight: 'Weight',
      barcode: 'Barcode',
      delivery_point: 'DeliveryPoint',
      phone: 'Phone',
      email: 'Email',
      contact: 'Contact',
      index_from: 'IndexFrom',
      index_to: 'IndexTo',
      region_code_to: 'RegionCodeTo',
      region_code_from: 'RegionCodeFrom',
      address: 'Address',
      time_from: 'TimeFrom',
      time_to: 'TimeTo',
      amount: 'Amount',
      valuated_amount: 'ValuatedAmount',
      comment: 'Comment',
      city: 'City',
      post_code: 'PostCode',
      post_region: 'PostRegion',
      post_area: 'PostArea',
      post_content_type: 'PostContentType',
      draft: 'Draft'
    }

    ITEM_PARAMS = {
     product_sku: 'productNo',
     product_name: 'productName',
     product_variant: 'productVariant',
     product_barcode: 'productBarCode',
     discount: 'discount',
     weight: 'weightLine',
     amount: 'amountLine',
     statistical_value: 'statisticalValueLine',
     quantity: 'itemQuantity',
     delivery_service: 'deliveryService',
     item_type: 'itemType',
     item_note: 'itemNote',
     allowed: 'allowed',
     vat_rate: 'VATRate',
     vat_amount: 'VATAmount'
    }

    class << self
      def call(query = {})
        items = query[:good_items]
        raise 'empty good items' if !items.is_a?(Array) || items.empty?
        good_items = []
        items.each do |item|
          good_item = {}
          item.each do |k, v|
            good_item[ITEM_PARAMS[k]] = v
          end
          good_items << good_item
        end
        params = { 'GoodItems' => good_items }

        query.each do |key, value|
          next if key == :good_items
          unless AVAILABLE_PARAMS.key?(key)
            raise "unkown key #{key}"
          end
          params[AVAILABLE_PARAMS[key]] = value
        end
        Request.request(params, :create_order)
      end
    end
  end
end
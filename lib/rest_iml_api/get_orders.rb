module RestImlApi
  class GetOrders
    # Параметры запроса
    # Test – тестовый режим, 'True' для тестового режима, иначе не указывайте
    # Job – услуга, Code из справочника услуг
    # CustomerOrder – номер заказа
    # DeliveryDateStart – дата доставки, запросы с датой доставки начиная с
    # указанной (включительно), тип значения строка в формате ‘dd.MM.yyyy’
    # DeliveryDateEnd - дата доставки, запросы с датой доставки по указанную,
    # тип значения строка в формате ‘dd.MM.yyyy’
    # State – состояние заказа, Code из таблицы состояний заказа
    # OrderStatus – статус заказа, Code из таблицы статусов заказа
    # CreationDateStart – дата создания, начиная с указанной (включительно),
    # тип значения строка в формате ‘dd.MM.yyyy’
    # CreationDateEnd - конечная дата создания, тип значения строка в
    # формате ‘dd.MM.yyyy’
    # RegionTo – регион получения, Code из таблицы регионов
    # RegionFrom – регион отправления, Code из таблицы регионов
    # BarCode – штрих код заказа в формате EAN-13
    #
    AVAILABLE_PARAMS = {
      test: 'Test',
      job: 'Job',
      customer_order_no: 'CustomerOrder',
      delivery_date_start: 'DeliveryDateStart',
      delivery_date_end: 'DeliveryDateEnd',
      state: 'State',
      order_status: 'OrderStatus',
      creation_date_start: 'CreationDateStart',
      creation_date_end: 'CreationDateEnd',
      region_to: 'RegionTo',
      region_from: 'RegionFrom',
      barcode: 'Barcode'
    }

    class << self
      def get_orders(query = {})
        begin
          params = {}
          query.keys.each do |key|
            if AVAILABLE_PARAMS.key?(key)
              params[AVAILABLE_PARAMS[key]] = query[key]
            else
              fail InvalidArgumentError.new(key)
            end
          end
          Request.request(params, :get_orders)
        rescue InvalidArgumentError => e
          puts "rescue from bad key: #{e.key}"
          query.delete(e.key)
          retry
        end
      end
    end
  end
end

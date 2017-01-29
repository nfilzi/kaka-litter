module GoogleDriveServices
  module Orders    
    class AddOrderToSpreadsheetService
      def initialize(order)
        @order = order
        @google_drive_session = GoogleDrive::Session.from_config(ENV["GOOGLE_DRIVE_JSON_FILEPATH"])
      end

      def call
        # Populating the Global spreadsheet
        worksheet = @google_drive_session.spreadsheet_by_key(Config::SPREADSHEET_KEY_GLOBAL).worksheets[0]
        next_row = worksheet.num_rows + 1
        populate_spreadsheet(worksheet, next_row)

        # Populating the US spreadsheet if applicable
        if @order.shipping_address.country == 'US'
          worksheet = @google_drive_session.spreadsheet_by_key(Config::SPREADSHEET_KEY_US).worksheets[0]
          next_row = worksheet.num_rows + 1
          populate_spreadsheet(worksheet, next_row)
        end
      end

      private
      def populate_spreadsheet(ws, next_row)
        # Extract these in query objects..? => FindOrderProductQuantityByProductId? Weird
        bag_quantity    = @order.order_details.find_by(product_id: 1).quantity
        box_quantity    = @order.order_details.find_by(product_id: 2).quantity

        ws[next_row, 1] = @order.created_at.strftime("%m-%d-%Y")
        ws[next_row, 2] = @order.company.name
        ws[next_row, 3] = @order.shipping_address.designation
        ws[next_row, 4] = @order.shipping_address.country_name
        ws[next_row, 5] = @order.total_price_ht
        ws[next_row, 6] = bag_quantity
        ws[next_row, 7] = box_quantity
        ws[next_row, 11] = @order.company.phone_number
        ws[next_row, 12] = @order.company.user.email
        ws[next_row, 13] = @order.observations
        ws[next_row, 14] = @order.first_order? ? "yes" : "no"
        ws.save
      end
    end
  end
end

module GoogleDriveServices
  module Orders    
    class AddOrderToSpreadsheetService
      def initialize(company)
        @order = order
        @google_drive_session = GoogleDrive::Session.from_config(ENV["GOOGLE_DRIVE_JSON_FILEPATH"])
      end

      def call
        worksheet = @google_drive_session.spreadsheet_by_key(Config::SPREADSHEET_KEY).worksheets[0]
        next_row = worksheet.num_rows + 1
        populate_spreadsheet(worksheet, next_row)
      end

      private
      def populate_spreadsheet(ws, next_row)
        ws[next_row, 1] = @order.created_at.strftime("%m-%d-%Y")
        ws[next_row, 2] = @order.company.name
        ws[next_row, 3] = @order.shipping_address.designation
        ws[next_row, 4] = @order.total_price_ht
        ws[next_row, 5] = @order.company.phone_number
        ws[next_row, 6] = @order.observations
        ws[next_row, 7] = @order.first_order? ? "yes" : "no"
        ws.save
      end
    end
  end
end

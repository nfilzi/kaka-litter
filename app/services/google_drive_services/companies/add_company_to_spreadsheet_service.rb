module GoogleDriveServices
  module Companies    
    class AddCompanyToSpreadsheetService
      def initialize(company)
        @company = company
        @google_drive_session = GoogleDrive::Session.from_config(ENV["GOOGLE_DRIVE_JSON_FILEPATH"])
      end

      def call
        worksheet = @google_drive_session.spreadsheet_by_key(Config::SPREADSHEET_KEY).worksheets[0]
        next_row = worksheet.num_rows + 1
        populate_spreadsheet(worksheet, next_row)
      end

      private
      def populate_spreadsheet(ws, next_row)
        ws[next_row, 1] = @company.name
        ws[next_row, 2] = @company.vat_number
        ws[next_row, 3] = @company.phone_number
        ws[next_row, 4] = @company.billing_address
        ws[next_row, 5] = @company.user.fullname
        ws[next_row, 6] = @company.user.email
        ws[next_row, 7] = @company.created_at.strftime("%m-%d-%Y")
        ws.save
      end
    end
  end
end

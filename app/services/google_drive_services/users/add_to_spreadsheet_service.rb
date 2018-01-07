module GoogleDriveServices
  module Users
    class AddToSpreadsheetService
      private
      attr_reader :user

      public
      def initialize(user)
        @user = user
        @google_drive_session = GoogleDrive::Session.from_config(ENV["GOOGLE_DRIVE_JSON_FILEPATH"])
      end

      def call
        worksheet = @google_drive_session.spreadsheet_by_key(Config::SPREADSHEET_KEY).worksheets[0]
        next_row = worksheet.num_rows + 1
        populate_spreadsheet(worksheet, next_row)
      end

      private
      def populate_spreadsheet(ws, next_row)
        ws[next_row, 1] = user.fullname
        ws[next_row, 2] = user.email
        ws[next_row, 3] = user.phone_number
        ws[next_row, 4] = user.vat_number
        ws[next_row, 5] = user.created_at.strftime("%m-%d-%Y")
        # Column 6 used for customer reduction on orders

        ws.save
      end
    end
  end
end

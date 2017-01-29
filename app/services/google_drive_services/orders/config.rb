module GoogleDriveServices
  module Orders
    class Config
      SPREADSHEET_KEY_US = GoogleDriveServices::Config::SPREADSHEET_KEYS[:orders_us]
      SPREADSHEET_KEY_GLOBAL = GoogleDriveServices::Config::SPREADSHEET_KEYS[:orders_global]
    end
  end
end

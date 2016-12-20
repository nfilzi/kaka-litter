module GoogleDrive
  class CreateCompanyService
    def initialize(company)
      @company = company
      @google_drive_session = GoogleDrive::Session.from_config(ENV[""])
    end
  end
end

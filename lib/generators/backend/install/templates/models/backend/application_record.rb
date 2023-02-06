class Backend::ApplicationRecord < ActiveRecord::Base
  include SpreadsheetArchitect; self.abstract_class = true; self.table_name_prefix = "backend_"
end

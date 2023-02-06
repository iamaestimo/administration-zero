class Backend::Current < ActiveSupport::CurrentAttributes
  attribute :user; resets { Time.zone = nil }
end

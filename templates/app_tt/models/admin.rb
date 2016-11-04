module Admin
  extend ActiveSupport::Concern

  included do
    include ActionView::Helpers::DateHelper
    include ActionView::Helpers::NumberHelper
  end
end

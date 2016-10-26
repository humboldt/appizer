module Admin::Setting
  extend ActiveSupport::Concern

  included do
    HIDDEN_SETTINGS = %i[
    ].freeze

    scope :settings, -> { where.not(name: HIDDEN_SETTINGS) }

    rails_admin do
      edit do
        field :name do
          read_only true
        end
        field :value, :string
        field :unit
      end

      show do
        configure :history, :pg_string_array
      end

      exclude_fields :created_at
    end
  end
end

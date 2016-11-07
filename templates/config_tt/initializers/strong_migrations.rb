ActiveRecord::Base.dump_schema_after_migration = Rails.env.development? && `git status db/migrate/ --porcelain`.present?

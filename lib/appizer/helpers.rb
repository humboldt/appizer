module Appizer
  module Helpers
    def new_file(path, data = nil, &block)
      log :new_file, path
      create_file(path, data, verbose: false, &block)
    end

    def copy_gem_file(gem, source, destination = nil)
      destination ||= source
      copy_file gem_file_path(gem, source), destination
    end

    def gem_file_path(gem, file)
      in_root do
        gem_root = `bundle show #{gem}`.strip
        file = File.join(gem_root, file)
      end
      file
    end

    def next_timestamp
      return @next_timestamp + 1 if @next_timestamp

      Dir['db/migrate/*.rb'].sort.last =~ /(\d{14})_/
      number = $1.to_i
      if number == 0
        number = Time.now.strftime('%Y%m%d%H%M%S').to_i
      end
      @next_timestamp = number + 1
    end

    def duplicate_locale(locale, name = nil)
      src_name = name ? "#{name}.en.yml" : "en.yml"
      dst_name = name ? "#{name}.#{locale}.yml" : "#{locale}.yml"
      src = "config_tt/locales/#{src_name}"
      dst = "config/locales/#{dst_name}"
      copy_file src, dst
      gsub_file dst, /^en/, locale
    end

    def other_locales_each
      options.locales.reject{ |l| l == 'en' }.each do |locale|
        yield locale
      end
    end

    protected

    # Define log for backwards compatibility. If just one argument is sent,
    # invoke say, otherwise invoke say_status. Differently from say and
    # similarly to say_status, this method respects the quiet? option given.
    def log(*args)
      if args.size == 1
        say args.first.to_s unless options.quiet?
      else
        args << (self.behavior == :invoke ? :green : :red)
        say_status(*args)
      end
    end
  end
end

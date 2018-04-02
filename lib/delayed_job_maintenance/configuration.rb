module DelayedJobMaintenance
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

  class Configuration
    def maintenance_file=(value)
      @maintenance_file = value
    end

    def maintenance_file
      @maintenance_file ||= Rails.root.join("public", "system", "maintenance.html")
    end
  end
end

DelayedJobMaintenance.configure {}

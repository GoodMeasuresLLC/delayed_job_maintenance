module Delayed
  module Maintenance
    def work_off(num=100)
      if File.exist?(DelayedJobMaintenance.configuration.maintenance_file)
        return [0,0]
      end

      super(num)
    end
  end
end

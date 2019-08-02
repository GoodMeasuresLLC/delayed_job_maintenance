module Delayed
  module Maintenance
    def work_off(num=100)
      if File.exist?(DelayedJobMaintenance.configuration.maintenance_file)
        Delayed::Worker.logger.info("delayed_job_maintenance is stopping delayed job processing")
        return [0,0]
      end

      super(num)
    end
  end
end

require 'test_helper'
require 'delayed_job'
require 'delayed_job_active_record'
require 'delayed_job_maintenance'

class DelayedJobMaintenance::Test < ActiveSupport::TestCase

  test "runs jobs without the maintenance file" do
    user = User.create!
    user.delay.process!
    result = Delayed::Worker.new.work_off

    assert_equal result, [1,0]

    user.reload
    assert_equal user.processed, true
  end

  test "doesn't run jobs with the maintenance file" do
    begin
      File.open( DelayedJobMaintenance.configuration.maintenance_file, "w") do |f|
        f.write("Down")
      end

      user = User.create!
      user.delay.process!
      result = Delayed::Worker.new.work_off

      assert_equal result, [0,0]

      user.reload
      assert_equal user.processed, false
    ensure
      File.delete(DelayedJobMaintenance.configuration.maintenance_file)
    end
  end
end

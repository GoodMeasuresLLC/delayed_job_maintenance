module Delayed
  class Worker
    prepend Delayed::Maintenance
  end
end

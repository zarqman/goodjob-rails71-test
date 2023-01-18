config = Rails.application.config
config.good_job = {
  execution_mode:   :external,
  shutdown_timeout: 25,

  cleanup_preserved_jobs_before_seconds_ago: 7.days,
  cleanup_interval_jobs:    false,
  cleanup_interval_seconds: 6.hours,
  preserve_job_records:     :on_unhandled_error,

  retry_on_unhandled_error: false,
  # on_thread_error: ->(ex){ Sentry.capture_exception(ex) },

  enable_cron: true,
  cron: {}
}

unless Rails.env.test?
  ActiveJob::Base.queue_adapter = :good_job
end

if GoodJob::CLI.within_exe && Rails.env.development?
  ActiveRecord::LogSubscriber.detach_from :active_record
end

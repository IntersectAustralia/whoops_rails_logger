require "digest"
require "whoops_logger"
require "whoops_rails_logger/exception_strategy"
require "whoops_rails_logger/rack"
require "whoops_rails_logger/railtie"

module WhoopsRailsLogger
  def self.initialize
    configure
    create_exception_strategy
  end
  
  def self.configure
    unless Rails.env.development?
      WhoopsLogger.config.set({:host => "deployment-tracker.intersect.org.au"})
      WhoopsLogger.config.logger = Rails.logger
    end
  end
  
  def self.create_exception_strategy
    strategy = WhoopsRailsLogger::ExceptionStrategy.new(:rails_exception)
  end  
end
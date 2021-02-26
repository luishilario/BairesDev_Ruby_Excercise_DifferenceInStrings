module LoggingModule
    require 'logger'
    
    def log message
        logger = Logger.new(STDOUT)
        logger.level = Logger::INFO
        logger.info message
    end

    def log_with_level(**args)
        logger = Logger.new(STDOUT)
        logger.level = Logger::DEBUG
        case args[:level]
        when "FATAL"
            logger.level = Logger::WARN
            logger.fatal args[:message]
        when "ERROR"
            logger.level = Logger::WARN
            logger.error args[:message]
        when "WARN"
            logger.level = Logger::DEBUG
            logger.warn args[:message]
        when "INFO"
          logger.level = Logger::INFO
          logger.info args[:message]
        when "DEBUG"
          logger.level = Logger::DEBUG
          logger.debug args[:message]
        end
    end
end
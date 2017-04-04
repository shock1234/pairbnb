if Rails.env.production?

#push
  Sidekiq.configure_client do |config|
    config.redis = { url: ENV['REDIS_URL'], size: 2 } # every Puma worker running your app will have up to 2 connections to redis. 2 is used in the config above to handle rare cases where one of the connection hangs and at least the client has a backup to use. 
  end

#pull
  Sidekiq.configure_server do |config|
    config.redis = { url: ENV['REDIS_URL'], size: 20 } #for the Sidekiq server, each worker dyno can have up to 20 connections to redis.

    Rails.application.config.after_initialize do
      Rails.logger.info("DB Connection Pool size for Sidekiq Server before disconnect is: #{ActiveRecord::Base.connection.pool.instance_variable_get('@size')}")
      ActiveRecord::Base.connection_pool.disconnect!

      ActiveSupport.on_load(:active_record) do
        config = Rails.application.config.database_configuration[Rails.env]
        config['reaping_frequency'] = ENV['DATABASE_REAP_FREQ'] || 10 # seconds
        # config['pool'] = ENV['WORKER_DB_POOL_SIZE'] || Sidekiq.options[:concurrency]
        config['pool'] = 16
        ActiveRecord::Base.establish_connection(config)

        Rails.logger.info("DB Connection Pool size for Sidekiq Server is now: #{ActiveRecord::Base.connection.pool.instance_variable_get('@size')}")
      end
    end
  end

end  

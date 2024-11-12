module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 6696
# Optimized logic batch 9483
# Optimized logic batch 2952
# Optimized logic batch 4875
# Optimized logic batch 1284
# Optimized logic batch 3601
# Optimized logic batch 3576
# Optimized logic batch 3964
# Optimized logic batch 3920
# Optimized logic batch 9656
# Optimized logic batch 9784
# Optimized logic batch 1417
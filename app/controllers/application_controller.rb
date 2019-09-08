class ApplicationController < ActionController::API
  # time-span to count the requests (in seconds)
  @@watching_timespan=60
  # maximum request allowed within the time-span
  @@allowed_requests=10
  # "cool-down" period in seconds
  @@blocking_timespan=5
  
  def not_found
    render json: {error: 'not_found'}
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
      check_rate_limiting(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { error: e.message }, status: :unauthorized
    end
  end

  private

  def check_rate_limiting(current_user)
    #compose key for counting requests
    user_key="counting_#{current_user}"
    #compose key for identifying blocked users
    blocked_user_key="locked_#{current_user}"
    #check if there is a "blocked" entry in Redis
    if $redis.get(blocked_user_key)
      render json: { error: "You have fired too many requests. Please wait for a couple of minutes."}, status: 429
    end
    if $redis.get(user_key)
      # main action: increment counter
      number_of_requests=$redis.incr(user_key)
      # check limit
      if number_of_requests > @@allowed_requests
        # write something into the log file for alerting
        Rails.logger.warn "Overheat: User with id #{user_key} is over usage limit."
        # mark the user as "blocked"
        $redis.set(blocked_user_key,1)
        # make the blocking expiring itself after the defined cool-down period
        $redis.expire(blocked_user_key,@@blocking_timespan)
      end
    else
      # no key for counting exists yet - so set a new one with ttl
      $redis.set(user_key,1)
      $redis.expire(user_key,@@watching_timespan)
    end
  end
end

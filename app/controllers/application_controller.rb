class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    # rescue_from ActiveController::RoutingError, with: :invalid_routes

    before_action :vertify_ip_address

    def invalid_routes
        # byebug
        render json: {error: "error"}
        # raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
    end
    private
    def record_invalid(exception_msg)
        render json: {error: exception_msg.record.errors.full_messages}, status: :unprocessable_entity
    end

    def record_not_found(exception_msg)
        # byebug
        render json: {error: exception_msg.message}, status: :not_found
    end

    def vertify_ip_address
        # byebug
    end
end

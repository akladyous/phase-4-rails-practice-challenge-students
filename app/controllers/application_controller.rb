class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private
    def record_invalid(exception_msg)
        render json: {error: exception_msg.record.errors.full_messages}, status: :unprocessable_entity
    end

    def record_not_found(exception_msg)
        # byebug
        render json: {error: exception_msg.message}, status: :not_found
    end
end

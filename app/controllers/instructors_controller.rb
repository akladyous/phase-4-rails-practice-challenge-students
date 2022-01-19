class InstructorsController < ApplicationController
    
    def create
        # @instructor = Instructor.create(instructor_params[:name])
        # if @instructor.valid?
        #     render json: @instructor, status: :ok
        # else
        #     render json: {error: @instructor.errors.full_messages}, status: unprocessable_entity
        # end
        @instructor = Instructor.create(name: instructor_params[:name])
        render json: @instructor, status: :ok
    end

    def show
        # byebug
        @instructor = load_instructor
        render json: @instructor, status: :ok
    end

    def update
        @instructor = load_instructor
        @instructor.update(name: params[:name])
        render json: @instructor, status: :ok
    end

    def destroy
        @instructor = load_instructor
        if @instructor
            @instructor.destroy
            render {}
        end
    end

    private

    def load_instructor
        
        Instructor.find(params[:id])
    end
    def instructor_params
        params.permit(:name)
    end
end

class StudentsController < ApplicationController
    def create
        # byebug
        if params[:instructor_id]
            @instructor = Instructor.find(params[:instructor_id])
            @student = @instructor.students.create!(name: params[:name], major: params[:major], age: params[:age])
            render json: @student, status: :ok
        end
    end

    def show
        @student = load_student
        render json: @student, status: :ok
    end

    def update
        @instructor = Instructor.find(params[:instructor_id])
        byebug
        @student = @instructor.students.find(params[:id])
        @student.update(student_params)
        render json: @student, status: :ok
    end

    def destroy
        @student = load_student
        @student.destroy
        render json: {}
    end

    private
    def student_params
        params.permit(:name, :major, :age)
    end
    def load_student
        Student.find(params[:id])
    end
end

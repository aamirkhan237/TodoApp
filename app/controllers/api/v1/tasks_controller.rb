class Api::V1::TasksController < ApiController
    before_action :set_task, only: [:show, :update, :destroy, :update_status]
    # skip_before_action :verify_authenticity_token
    def index
        @tasks = current_user.tasks.filter_by_status(params[:status])
        render json: @tasks
      end
    def show
        render json: @task
    end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
          render json: @task, status: :created
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end


      def update
        if @task.update(task_params)
            render json: @task
          else
            render json: @task.errors, status: :unprocessable_entity
          end
        end
      def destroy
        @task.destroy
        head :no_content  # Respond with 204 No Content on successful deletion
      end

      def update_status
        if @task.update(status: params[:status])
          render json: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

    private
    def set_task
        @task = current_user.tasks.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
        render json:error.message , status: :unauthorized
    end

    def task_params
        params.require(:task).permit(:title, :description, :status)
    end
end
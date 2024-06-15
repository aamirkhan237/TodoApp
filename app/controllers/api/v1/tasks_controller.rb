class Api::V1::TasksController < ApiController
  before_action :set_task, only: [:show, :update, :destroy, :update_status]
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  # GET /api/v1/tasks
  def index
    @tasks = current_user.tasks.filter_by_status(params[:status])
    render json: @tasks
  end

  # GET /api/v1/tasks/:id
  def show
    render json: @task
  end

  # POST /api/v1/tasks
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/tasks/:id
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/tasks/:id
  def destroy
    @task.destroy
    render json: { message: 'Task was successfully destroyed.' }, status: :ok
  end

  # PATCH /api/v1/tasks/:id/update_status
  def update_status
    if @task.update(status: params[:status])
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  # Set the task before certain actions
  def set_task
    @task =Task.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    render json: { error: error.message }, status: :not_found
  end

  # Permit only the allowed parameters
  def task_params
    params.require(:task).permit(:title, :description, :status)
  end
end

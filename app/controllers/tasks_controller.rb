class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :update_status]

  # GET /tasks
  def index
    @task = Task.new
    @pagy, @tasks = pagy(current_user.tasks)
    @tasks = @tasks.filter_by_status(params[:status]) if params[:status].present?
  end

  # GET /tasks/:id
  def show
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.user = current_user

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      @tasks = current_user.tasks
      render :index, status: :unprocessable_entity
    end
  end

  # GET /tasks/:id/edit
  def edit
  end

  # PATCH/PUT /tasks/:id
  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/:id
  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully deleted.'
  end

  # PATCH /tasks/:id/update_status
  def update_status
    if @task.update(status: params[:status])
      redirect_to tasks_path(status: params[:status]), notice: 'Task status updated successfully.'
    else
      redirect_to tasks_path(status: params[:status]), alert: 'Failed to update task status.'
    end
  end

  private

  # Set the task before certain actions
  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  # Permit only the allowed parameters
  def task_params
    params.require(:task).permit(:title, :description, :status)
  end

  # Authenticate user before performing actions
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, alert: 'You need to sign in before continuing.'
    end
  end
end

class TasksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task , only: [:show, :edit, :update,:destroy,:update_status]
    def index
        @task = Task.new
        @pagy, @tasks = pagy(current_user.tasks)
        @tasks = @tasks.filter_by_status(params[:status]) if params[:status].present?
    end
    def show
    end
  
    def create
        @task= Task.new(task_params)
        @task.user = current_user
      if @task.save
        redirect_to @task, notice: 'Task was successfully created.'
      else
        @tasks = current_user.tasks
        render :index ,status: :unprocessable_entity 
      end
    end
  
    def edit
    end
  
    def update
      if @task.update(task_params)
        redirect_to tasks_path, notice: 'Task was successfully created.'
      else
        render :edit, status: :unprocessable_entity 
      end
    end
  
    def destroy
      @task.destroy
      redirect_to tasks_path, notice: 'Task was successfully deleted.'
    end

    def update_status
        if @task.update(status: params[:status])
          redirect_to tasks_path(status: params[:status]), notice: 'Task status updated successfully.'
        else
          redirect_to tasks_path(status: params[:status]), alert: 'Failed to update task status.'
        end
      end
    
    private
      def set_task
        @task =Task.find(params[:id])
      end
    def task_params
      params.require(:task).permit(:title, :description, :status)
    end
  end
  
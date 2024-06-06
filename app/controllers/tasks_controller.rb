class TasksController < ApplicationController
    before_action :authenticate_user!
    def index
        @task = Task.new
        @tasks = current_user.tasks
        @tasks = @tasks.filter_by_status(params[:status]) if params[:status].present? 
    end
    def show
      @task = Task.find(params[:id])
    end
  
    def create
        @task= Task.new(task_params)
        @task.user = current_user
    # @task = current_user.tasks.build(task_params)
      if @task.save
        redirect_to @task, notice: 'Task was successfully created.'
      else
        @tasks = Task.all
        render :index
      end
    end
  
    def edit
      @task = Task.find(params[:id])
    end
  
    def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
        redirect_to @task, notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to tasks_path, notice: 'Task was successfully deleted.'
    end

    def update_status
        @task = Task.find(params[:id])
        if @task.update(status: params[:status])
          redirect_to tasks_path(status: params[:status]), notice: 'Task status updated successfully.'
        else
          redirect_to tasks_path(status: params[:status]), alert: 'Failed to update task status.'
        end
      end
    
    private
  
    def task_params
      params.require(:task).permit(:title, :description, :status)
    end
  end
  